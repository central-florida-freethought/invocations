Feature: Create UserMeeting
  As a volunteer
  I want to create a new UserMeeting
  So the data can be collected
  
  Background:
    Given a locality with name "Orlando City Council"
    Given a religion
    Given an approved volunteer

  Scenario Outline: Successfully create a meeting
    Given the volunteer has the <role> role
    And volunteer is signed in
    When I visit the localities page
    And I click "Orlando City Council"
    And I click "Submit a new meeting"
    And I fill in the meeting fields
    And I click "Create meeting"
    Then I should see <message>
    
    Examples:
      | role      | message                         |
      | "user"    | "created and will be reviewed." |
      | "trusted" | "created and approved."         |
    
  Scenario: Cannot create a meeting without logging in
    When I visit the new user meeting page
    Then I should be on the login page
    And I should see "You need to sign in or sign up before continuing."
    