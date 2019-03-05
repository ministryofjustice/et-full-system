@e2e
@javascript
Feature:
  As a PDF
  I want to ensure that all fields are displaying in PDF form
  So civil servant can triage an employees claim against their employer

  Scenario: Your details - contact by post
    Given an employee making a claim wishing to be contact by 'post'
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Your details - contact by email
    Given an employee making a claim wishing to be contact by 'email'
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Another person has the Acas number
    Given an employee making a claim with joint claim acas number
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Acas doesnt have the power
    Given an employee making a claim with no jurisdiction
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Employer already been in touch
    Given an employee making a claim with employer contacted acas
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Unfair dismissal
    Given an employee making a claim with interim relief
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Not aware of multiple cases against the same employer
    Given an employee making a claim against an employer not aware of multiple cases against the same employer
    When the completed form is submitted
    Then I can download the form and validate in PDF format