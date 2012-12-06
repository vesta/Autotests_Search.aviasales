require 'capybara/rspec'
#require 'capybara/firebug'
require 'active_support/core_ext'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :selenium
Capybara.run_server = false
Capybara.app_host = "http://beta-search.aviasales.ru"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = :random
end
