require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'

Capybara.configure do | config |
  config.run_server = false
  config.default_driver = :selenium_chrome
  config.app_host = 'https://www.google.com'
end
 
Given("I ask for the google home page") do
  visit('/')
end

Then("it should load") do
  expect(page).to have_css('input[value="Google Search"')
end
