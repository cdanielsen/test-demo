require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'

require_relative '../page_objects/RedfinHome.po'
rf = RedFinHomePage.new

Given("I load the redfin.com login form") do
  visit('/')
  expect(page).to have_title(rf.homePageTitleText)

  find(rf.loginButton).click
  expect(page).to have_selector(rf.emailSignInButton)

  find(rf.emailSignInButton).click
  expect(page).to have_selector(rf.loginFormEmailField)
  expect(page).to have_selector(rf.loginFormPasswordField)
end

When("I enter valid credentials into it") do
  fill_in('emailInput', with: ENV['REDFIN_USER'])
  fill_in('passwordInput', with: ENV['REDFIN_PASSWORD'])
  find(rf.loginFormSubmitButton).click
  # Ugly, but seems needed for Redfin's login logic to settle at the moment
  sleep(1)
end

Then("I should be logged in") do
  visit('/myredfin/settings')
  expect(page).to have_css("h1.title", :text => "Account Settings")
end
