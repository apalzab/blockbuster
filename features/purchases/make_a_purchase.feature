Feature: Make a purchase
  I want to be able to purchase a movie

  Scenario: Not Logged in
    Given I do not exist as user
    When I go to a movie page
    Then I can not purchase a movie

  Scenario: Logged in
    Given I am logged in
    When I go to a movie page
    And I click purchase
    Then I should go to purchases path