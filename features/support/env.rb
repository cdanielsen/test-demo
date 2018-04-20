require 'dotenv/load'
require 'capybara'

Capybara.configure do | config |
  if ENV["CI"] == 'true'
    config.default_driver = :selenium_chrome_headless
  else
    config.default_driver = :selenium_chrome
  end
  config.run_server = false
  config.default_max_wait_time = 5
  config.app_host = 'https://www.redfin.com'
end