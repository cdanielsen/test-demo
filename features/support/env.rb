require 'dotenv/load'
require 'capybara'

Capybara.configure do | config |
  if ENV["CI"] == 'true'
    config.default_driver = :selenium_chrome_headless
  else
    config.default_driver = :selenium
  end
  config.run_server = false
  config.default_max_wait_time = 15
  config.app_host = 'https://www.redfin.com'
  config.ignore_hidden_elements = false
end