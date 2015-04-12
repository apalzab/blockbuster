@log_in
Feature: Log In
  I want to be able to login
  into my account

  Scenario: With an invalid user
    When I go to the login page
    And I log in with invalid credentials
    Then I should see invalid message

  Scenario: With a valid user
    When I go to the login page
    And I log in with valid credentials
    And I should be logged in
