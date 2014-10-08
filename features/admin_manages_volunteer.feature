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

  Scenario Outline: add role to volunteer
    Given the volunteer is active
    And the volunteer does not have the <role> role
    When I visit the active volunteers page
    And I add the <role> role
    Then I should see "Volunteer was successfully updated"

    Examples:
      | role    |
      | trusted |
      | admin   |

