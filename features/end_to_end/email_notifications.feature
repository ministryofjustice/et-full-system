@e2e
@javascript
Feature:
  As an Employment tribunal
  I want to ensure that users submitting E1 or ET3 form get an email notifications

  Scenario: ET1 - Complete your claim
    Given a claimant continued from Saving your claim page
    Then an email is sent to notify user that a claim has been started

  Scenario: ET1 - Completed claimant's form
    When a claimant completed an ET1 form
    Then an email is sent to notify user that a claim has been successfully submitted

  Scenario: ET3 - Completed respondent's form
    When a respondent completed an ET3 form
    Then an email is sent to notify user that a respondent has been successfully submitted@