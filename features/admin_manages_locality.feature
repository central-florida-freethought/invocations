Feature: Admin manages locality
  So that users can create meetings within localities
  As an admin user
  I want to manage localities
  
  Background:
    Given a admin volunteer
    And volunteer is confirmed and approved
    And volunteer is signed in
  
  Scenario: create a new locality
    When I visit the new locality page
    And I fill in the locality fields
    And I click "Create Locality"
    Then I should see "locality successfully created"
    
  Scenario: update an existing locality
    Given a locality with name Orlando City Council
    When I go to the locality page for Orlando City Council
    And I click "Edit this locality"
    Then I should be on the edit locality page for Orlando City Council
    And I click "Update Locality"
    Then I should see "successfully updated"