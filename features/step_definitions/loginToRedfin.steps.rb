require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'

Capybara.configure do | config |
  config.run_server = false
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 5
  config.app_host = 'https://www.redfin.com'
end
 
emailSignInButton = 'div.emailSignInButtonWrapper button'
loginButton = 'button[data-rf-test-name="SignInLink"]'
homePageTitleText = 'Redfin'
loginFormEmailField = 'input[name=emailInput]'
loginFormPasswordField = 'input[name=passwordInput]'
loginFormSubmitButton = 'div.SignInEmailForm button[data-rf-test-name=submitButton]'

Given("I load the redfin.com login form") do
  visit('/')
  expect(page).to have_title(homePageTitleText)

  find(loginButton).click
  expect(page).to have_selector(emailSignInButton)

  find(emailSignInButton).click
  expect(page).to have_selector(loginFormEmailField)
  expect(page).to have_selector(loginFormPasswordField)
end

When("I enter valid credentials into it") do
  fill_in('emailInput', with: ENV['REDFIN_USER'])
  fill_in('passwordInput', with: ENV['REDFIN_PASSWORD'])
  find(loginFormSubmitButton).click
  
  # Yuck, but seems needed for Redfin's login logic to settle
  sleep(1)
end

Then("I should be logged in") do
  visit('/myredfin/settings')
  expect(page).to have_css("h1.title", :text => "Account Settings")
end
