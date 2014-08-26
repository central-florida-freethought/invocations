Feature: Visitor signs up
  So that I can create meetings
  As a visitor
  I want to sign up for an account
  
  Background:
    Given I am not signed in
  
  Scenario: with valid credentials
    When I sign up with valid credentials
    Then I should see "A message with a confirmation link has been sent to your email address."
    
  Scenario Outline: with invalid email address
    When I sign up with email <invalid email>
    Then I should see "Email is invalid"
    
    Examples: email addresses
      | invalid email            |
      | chunky@bacon_com         |
      | chunky.bacon.com         |
      | chunky bacon@example.com |
      
  Scenario Outline: with invalid password
    When I sign up with password <password>
    Then I should see <message>
    
  Examples:
    | password | message                   |
    | ""       | "Password can't be blank" |
    | "shorty" | "Password is too short"   |
    
  Scenario Outline: password confirmation doesn't match
    When I sign up with the password "Password1" and confirmation <confirmation>
    Then I should see "Password confirmation doesn't match"
    
  Examples:
    | confirmation |
    | ""           |
    | "p@ssword"   |
