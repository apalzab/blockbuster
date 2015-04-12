Feature: See a Movie
  See a movie details

  Scenario: See a movie details through index movies
    When I go to the movies path
    And I click one of see movie buttons
    Then I should see movie details
