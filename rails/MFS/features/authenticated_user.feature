Feature: Testing authenticated user

  Scenario: Authenticated user should see
    "Post review" button on the main page
    Given I am authenticated
    And I am on the main page
    Then I should see Post review button
    And I should not be able to visit admin users page

  Scenario: Admin user should see
  "Post review" button on the main page and should be able
    to administer users
    Given I am admin
    And I am on the main page
    Then I should see Post review button
    And I should be able to visit admin users page