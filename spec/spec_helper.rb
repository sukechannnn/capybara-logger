require 'bundler/setup'
require 'capybara_logger'
require 'capybara/rspec'
Bundler.require(:default, :development)
require 'test_site.rb'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Capybara.app = TestSite.new
Capybara.default_driver = :selenium
Capybara.server = :webrick
Capybara.server_port = 9292
Capybara.app_host = 'http://localhost:9292'
chrome_options = { args: %w[headless disable-gpu window-size=1680,1050] }

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: chrome_options),
  )
end
