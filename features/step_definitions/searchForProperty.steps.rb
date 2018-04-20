require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'

require_relative '../page_objects/RedfinHome.po'
require_relative '../page_objects/RedfinSearchResults.po'

# TODO: Refactor this into destructuring assignment?
rfhp = RedFinHomePage.new
rfsr = RedfinSearchResults.new

Given("I perform a basic search for homes in Portland, OR") do
  visit('/')
  find_all(rfhp.searchInputs).first().send_keys('Portland, OR')
  find_all(rfhp.searchSubmits).first().click
  expect(page).to have_selector(rfsr.saveSearchButton)
end

When("I enter three filters into the search page") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should only get back results that meet those filters") do
  pending # Write code here that turns the phrase above into concrete actions
end