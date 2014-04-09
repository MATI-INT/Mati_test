Feature: Testing admin user access

  Background:
    Given I am admin

  @javascript
  Scenario: Admin user should be able to grant and revoke admin rights
    Given there is a user
    And I visit admin users page
    When I grant the user admin rights