class RedfinSearchResults 
  attr_reader :saveSearchButton
  
  def initialize
    @saveSearchButton = 'button[data-rf-test-id=save-search-button]'
  end
end