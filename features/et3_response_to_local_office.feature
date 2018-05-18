@e2e
@javascript
Feature: ET3 Claim To Local Office
  Scenario: Create and send ET3 TXT file to claimant's local office
    Given I am the respondent "company01" with a unique first name
    When I submit a completed ET3 form
    And I take note of my ET3 reference number
    Then my entered data is formatted into a TXT format for my ET3 reference number and is available for ATOS to download
