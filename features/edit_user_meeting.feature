Feature: User edits user meeting
  As a user volunteer
  I want to edit my existing meetings
  So that I can update information as needed

  Background:
    Given an approved volunteer
    And volunteer is signed in
    And a approved user meeting

  Scenario:
    When I go to the meeting page
    And I edit the meeting
    Then I should be back on the meeting page

