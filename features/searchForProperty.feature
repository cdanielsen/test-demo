Feature: Search for a property with filters
 
Scenario: A search for a property in Portland, OR
  Given I perform a basic search for homes in Portland, OR
  When I enter three filters into the search page
  Then I should only get back results that meet those filters
