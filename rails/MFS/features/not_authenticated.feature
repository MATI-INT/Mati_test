Feature: Testing anonymous user access.

  Scenario: When an anonymous user access main page
    he should see "Authenticate via Twitter" button.
    He should not be able to post reviews.
    Given I am on the main page
    Then I should see authentication button
