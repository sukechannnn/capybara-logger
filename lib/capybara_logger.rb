require 'capybara_logger/version'
require 'capybara_logger/log'
require 'capybara'

module CapybaraLogger
  refine Capybara::Session do
    # Outputs URL accessed by Capybara to the log
    #
    # @see https://github.com/teamcapybara/capybara/blob/3.1.1/lib/capybara/session.rb
    def visit(visit_uri)
      LOG.info("Capybara visit #{visit_uri}")
      super
    end

    # Output the elements accessed by Capybara to the log
    #
    # @see https://github.com/teamcapybara/capybara/blob/3.1.1/lib/capybara/node/finders.rb
    def find(*args, **options, &optional_filter_block)
      LOG.info("Capybara find #{args.join(' ')}")
      super
    end
  end
end
