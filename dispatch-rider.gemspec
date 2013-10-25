# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dispatch-rider"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Suman Mukherjee"]
  s.date = "2013-10-25"
  s.description = "Messaging system that is customizable based on which queueing system we are using."
  s.email = ["sumanmukherjee03@gmail.com"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "lib/dispatch-rider.rb",
    "lib/dispatch-rider/callbacks.rb",
    "lib/dispatch-rider/callbacks/access.rb",
    "lib/dispatch-rider/callbacks/storage.rb",
    "lib/dispatch-rider/command.rb",
    "lib/dispatch-rider/configuration.rb",
    "lib/dispatch-rider/demultiplexer.rb",
    "lib/dispatch-rider/dispatcher.rb",
    "lib/dispatch-rider/error_handlers.rb",
    "lib/dispatch-rider/errors.rb",
    "lib/dispatch-rider/handlers.rb",
    "lib/dispatch-rider/handlers/base.rb",
    "lib/dispatch-rider/handlers/inheritance_tracking.rb",
    "lib/dispatch-rider/handlers/named_process.rb",
    "lib/dispatch-rider/message.rb",
    "lib/dispatch-rider/notification_services.rb",
    "lib/dispatch-rider/notification_services/aws_sns.rb",
    "lib/dispatch-rider/notification_services/base.rb",
    "lib/dispatch-rider/notification_services/file_system.rb",
    "lib/dispatch-rider/notification_services/file_system/channel.rb",
    "lib/dispatch-rider/notification_services/file_system/notifier.rb",
    "lib/dispatch-rider/publisher.rb",
    "lib/dispatch-rider/publisher/configuration_reader.rb",
    "lib/dispatch-rider/queue_services.rb",
    "lib/dispatch-rider/queue_services/aws_sqs.rb",
    "lib/dispatch-rider/queue_services/aws_sqs/message_body_extractor.rb",
    "lib/dispatch-rider/queue_services/base.rb",
    "lib/dispatch-rider/queue_services/file_system.rb",
    "lib/dispatch-rider/queue_services/file_system/queue.rb",
    "lib/dispatch-rider/queue_services/simple.rb",
    "lib/dispatch-rider/registrars.rb",
    "lib/dispatch-rider/registrars/base.rb",
    "lib/dispatch-rider/registrars/file_system_channel.rb",
    "lib/dispatch-rider/registrars/handler.rb",
    "lib/dispatch-rider/registrars/notification_service.rb",
    "lib/dispatch-rider/registrars/publishing_destination.rb",
    "lib/dispatch-rider/registrars/queue_service.rb",
    "lib/dispatch-rider/registrars/sns_channel.rb",
    "lib/dispatch-rider/runner.rb",
    "lib/dispatch-rider/subscriber.rb",
    "lib/dispatch-rider/version.rb"
  ]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Messaging system based on the reactor patter. You can publish messages to a queue and then a demultiplexer runs an event loop which pops items from the queue and hands it over to a dispatcher. The dispatcher hands over the message to the appropriate handler. You can choose your own queueing service."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<activemodel>, [">= 0"])
      s.add_runtime_dependency(%q<daemons>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<travis-lint>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<debugger>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<activemodel>, [">= 0"])
      s.add_dependency(%q<daemons>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<travis-lint>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<debugger>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<activemodel>, [">= 0"])
    s.add_dependency(%q<daemons>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<travis-lint>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<debugger>, [">= 0"])
  end
end

