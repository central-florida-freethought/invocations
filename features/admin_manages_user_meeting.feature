Feature: Admin manages user meeting
  As an admin volunteer
  I want to manage user meetings
  So that they can be verified and approved

  Background:
    Given a signed in admin
    And a pending user meeting
    When I visit the user meetings page
  
  Scenario Outline: 
    When I <action> the meeting
    Then I should see <message>
    And a meeting <email_type> email should be sent

  Examples:
    | action  | message                             | email_type |
    | approve | "Meeting was successfully approved" | approved   |
    | deny    | "Meeting was denied"                | denied     |
    | review  | "Meeting is in review"              | reviewed   |

