Feature: Logging into Redfin
 
Scenario: Successful login       
  Given I load the redfin.com login form
  When I enter valid credentials into it
  Then I should be logged in
