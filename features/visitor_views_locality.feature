Feature: User locality
  So that I can see what localities are available
  As a user
  I should be able to view localities
  
  Background:
    Given a locality with name Orlando City Council
    When I visit the localities page
  
  Scenario: visitor views locality
    And I click "Orlando City Council"
    Then I should be on the locality page for Orlando City Council
    But I should not see "Edit this locality"
    
  Scenario: visitor cannot see link to add locality
    Then I should not see "Add a new locality!"
    