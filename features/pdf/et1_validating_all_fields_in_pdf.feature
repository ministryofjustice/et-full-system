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
    Given an employee making a claim wishing to be contact by 'Email'
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Your details - contact by fax
    Given an employee making a claim wishing to be contact by 'fax'
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - 3 Respondents
    Given an employee making a claim
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Acas number
    Given an employee making a claim with an acas number
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Another person has the Acas number
    Given an employee making a claim with no acas number "Another person I'm making the claim with has an Acas early conciliation certificate number"
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Acas doesnt have the power
    Given an employee making a claim with no acas number "Acas doesn’t have the power to conciliate on some or all of my claim"
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Employer already been in touch
    Given an employee making a claim with no acas number "My employer has already been in touch with Acas"
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Respondent details - Unfair dismissal
    Given an employee making a claim with no acas number "My claim consists only of a complaint of unfair dismissal which contains an application for interim relief. (See guidance)"
    When the completed form is submitted
    Then I can download the form and validate in PDF format