Feature: Admin manages volunteer
  So that volunteers can create meetings
  As an admin
  I should be able to manage volunteers
  
  Background:
    Given a signed in admin
    And a regular, confirmed volunteer
    
  Scenario: activate a volunteer
    When I visit the inactive volunteers page
    And I activate the volunteer
    Then I should see "Volunteer was successfully activated"
    And an activated email should be sent
    
  Scenario: deactivate a volunteer
    Given the volunteer is active
    When I visit the active volunteers page
    And I deactivate the volunteer
    Then I should see "Volunteer was successfully deactivated"
    And a deactivated email should be sent