@e2e
@javascript
Feature: ET1 Claim To Local Office
  Scenario: Create and send ET3 TXT file to claimant's local office
    Given I am the respondent "company01" with a unique first name
    When I submit a completed ET3 form
    Then my entered data is formatted into a TXT format
    And the TXT file is stored in a landing folder *
