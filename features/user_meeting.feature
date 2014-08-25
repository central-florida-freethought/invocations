Feature: Create UserMeeting
  As a volunteer
  I want to create a new UserMeeting
  So the data can be collected
  
  Background:
    Given a locality with name "Orlando City Council"
    Given a religion
    Given an approved volunteer
  
  Scenario: Successfully create a pending meeting
    Given volunteer is signed in
    When I visit the localities page
    And I click "Orlando City Council"
    And I click "Submit a new meeting"
    And I fill in the meeting fields
    And I click "Create meeting"
    And the meeting should have my user ID
    And the meeting should be pending
    And the meeting should have a Speaker
    
  Scenario: Successfully create a meeting by a trusted user
    Given the volunteer is trusted
    And volunteer is signed in
    When I visit the localities page
    And I click "Orlando City Council"
    And I click "Submit a new meeting"
    And I fill in the meeting fields
    And I click "Create meeting"
    Then I should see "successfully created and approved."
    And the meeting should not be pending
    
  Scenario: Cannot create a meeting without logging in
    When I visit the new user meeting page
    Then I should be on the login page
    And I should see "You need to sign in or sign up before continuing."