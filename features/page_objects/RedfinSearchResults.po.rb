class RedfinSearchResults 
  attr_reader :saveSearchButton,
    :moreFiltersLink,
    :houseFilterButton,
    :houseFilterButtonClickedState,
    :bathsIncrementButton,
    :bathsValueDisplay,
    :listingStatusMoreOptions,
    :mlsListingsCheckbox,
    :applyFiltersButton,
    :tableViewLink,
    :resultsTableRows
  
  def initialize
    @saveSearchButton = 'button[data-rf-test-id=save-search-button]'
    @moreFiltersLink = 'button[data-rf-test-id=filterButton]'
    @houseFilterButton = 'button[data-rf-test-name=uipt1]'
    @houseFilterButtonClickedState = 'button.pressed[data-rf-test-name=uipt1]'
    @bathsIncrementButton = '.baths .step-up'
    @bathsValueDisplay = '.baths .value'
    @listingStatusMoreOptions = '[data-rf-test-id=forSaleToggleRow] button.showToggleHeader'
    @mlsListingsCheckbox = 'input[name=mlsListings]'
    @applyFiltersButton = '[data-rf-test-id=apply-search-options]'
    @tableViewLink = '[data-rf-test-name=tableOption]'
    @resultsTableRows = '.TableView table tr[id*=ReactDataTableRow]'
  end
end