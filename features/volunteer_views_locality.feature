Feature: Volunteer views locality
  So that I can add a meeting to a locality
  As a user
  I should be able to view localities

  Background:
    Given a regular volunteer
    And volunteer is confirmed and approved
    And volunteer is signed in
    
  Scenario: registered user cannot create localities
    When I visit the new locality page
    Then I should see "not authorized to create a new locality"
    
  Scenario: registered user cannot see link to create locality
    When I visit the localities page
    Then I should not see "Add a new locality!"