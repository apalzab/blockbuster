@sign_up
Feature: Sign Up
  I want to be able to sign up

  Scenario: With an invalid user
    When I go to the sign up page
    And I sign up with invalid data
    Then I should see errors

  Scenario: With a valid user
    Given I do not exist as user
    When I go to the sign up page
    And I log in with valid credentials
    And I should be signed up
