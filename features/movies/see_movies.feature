Feature: See Movies
  Index view of the movies

  Scenario: Visit root path
    Given I do not exist as user
    When I go to the root path
    Then I should see movies
