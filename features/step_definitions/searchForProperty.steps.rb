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
  # Pull up full filter list
  find(rfsr.moreFiltersLink).click
  expect(page).to have_selector(rfsr.houseFilterButton)
  
  # Houses only
  find(rfsr.houseFilterButton).click
  expect(page).to have_selector(rfsr.houseFilterButtonClickedState)

  # At least 2 bathrooms
  find(rfsr.bathsIncrementButton).click.click.click
  text = find(rfsr.bathsValueDisplay).text
  expect(text).to eq('2+')

  # Search by owner only to limit managing timing for heavy MLS api call
  find(rfsr.listingStatusMoreOptions).click
  find(rfsr.mlsListingsCheckbox).click

  # Apply filters
  find(rfsr.applyFiltersButton).click
  find(rfsr.tableViewLink).click
end

Then("I should only get back results that meet those filters") do
  find_all('.TableView table .tableRow .col_baths').each do | numberOfBathsEl |
    numberOfBaths = numberOfBathsEl.text.to_i
    expect(numberOfBaths >= 2).to be(true)
  end
end