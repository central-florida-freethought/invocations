Feature: Admin manages user meeting
  As an admin volunteer
  I want to manage user meetings
  So that they can be verified and approved

  Scenario: approve user meeting
    Given a signed in admin
    And a pending user meeting
    When I visit the user meetings page
    And I approve the meeting
    Then I should see "Meeting was successfully approved"
    And a meeting approved email should be sent

