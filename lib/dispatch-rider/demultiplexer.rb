# The demultiplexer in the reactor pattern is implemented in this class.
# The object needs to be initiated with a queue and a dispatcher.
# Demultiplexer#start defines an event loop which pops items from the queue
# and passes it on to the dispatcher for dispatching to the appropriate message handler.
# The demultiplexer can be stopped by calling the Demultiplexer#stop method.
module DispatchRider
  class Demultiplexer
    attr_reader :queue, :dispatcher, :error_handler

    def initialize(queue, dispatcher, error_handler)
      @queue = queue
      @dispatcher = dispatcher
      @error_handler = error_handler
      @continue = true
      @current_message = nil
    end

    def start
      do_loop do
        begin
          handle_next_queue_item
        rescue => exception
          error_handler.call(Message.new(subject: "TopLevelError", body: {}), exception)
          throw :done
        end
      end
      self
    end

    def stop(reason: nil)
      @continue = false
      if @current_message
        logger.info "Got stop #{reason ? '(' + reason + ') ' : ' ' }while executing: #{message_info_fragment(@current_message)}"
      end
    end

    private

    def with_current_message(message)
      begin
        @current_message = message
        yield
      ensure
        @current_message = nil
      end
    end

    # This needs to return true/false based on the success of the jobs!
    def dispatch_message(message)
      with_current_message(message) do
        dispatcher.dispatch(message)
      end
    rescue => exception
      handle_message_error message, exception
      false
    end

    def do_loop
      catch(:done) do
        loop do
          throw :done unless @continue
          yield
        end
      end
    end

    def message_info_fragment(message)
      "(#{message.guid}): #{message.subject} : #{message_info_arguments(message).inspect}"
    end

    def message_info_arguments(message)
      message.body.dup.tap { |m|
        m.delete('guid')
      }
    end

    def handle_next_queue_item
      queue.pop do |message|
        begin
          logger.info "Starting execution of: #{message_info_fragment(message)}"
          dispatch_message(message).tap {
            logger.info "Succeded execution of: #{message_info_fragment(message)}"
          }
        ensure
          logger.info "Completed execution of: #{message_info_fragment(message)}"
        end
      end
    end

    def exception_info_fragment(message, exception)
      "(#{message.object_id}): #{message.subject} with #{exception.class}: #{exception.message}"
    end

    def handle_message_error(message, exception)
      begin
        logger.error "Failed execution of: #{exception_info_fragment(message, exception)}"
        error_handler.call(message, exception)
      rescue => error_handler_exception # the error handler crashed
        logger.error "Failed error handling of: #{exception_info_fragment(message, error_handler_exception)}"
        raise error_handler_exception
      end
    end

    def logger
      DispatchRider.config.logger
    end

  end
end
