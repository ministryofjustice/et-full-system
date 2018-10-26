@javascript
Feature:
  As Additional respondent's details page
  I want to ensure that user can submit their Additional respondent's details in Welsh or in English

  Background: Additional respondent's details page
    Given a claimant is on Additional respondent's details page 

  Scenario: Verify copy text for Additional respondent's details page
    Then I can verify that the copy text on Additional respondent's details page displayed correctly

  Scenario: Verify blank submission for error messages
    When I submit a blank Additional respondent's details page
    Then I can verify blank error messages for Additional respondent's details page

  Scenario: Invalid UK postcode error message
    When entering invalid postcode for Additional respondent's details page
    Then I can verify an invalid UK postcode is being used for Additional respondent's details page

  Scenario: Answering no to claims against more than one employer
    When I answer no to claims against more than one employer
    Then I should be taken to Employment details page

  Scenario: Claims against 3 employers
    When I submit claims against 3 employers
    Then I should be taken to Employment details page

  Scenario: Remove respondent
    When I submit claims against 3 employers
    And remove one of them
    Then I should only have 2 repondents