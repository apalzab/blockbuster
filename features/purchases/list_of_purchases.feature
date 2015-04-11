Feature: List user purchases
  I want to be able to see my purchases

  Scenario: With an invalid user
    Given I do not exist as user
    When I go to purchases page
    Then I should be redirected to new user session path

  Scenario: With a valid user
    Given I am logged in
    When I go to purchases page
    Then I should see my purchases