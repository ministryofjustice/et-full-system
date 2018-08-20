@e2e
@javascript
Feature: ET3 response to local office
  As an ATOS admin
  I want to be able to download completed Employment Tribunal response form
  So I can triage an employers response made against them

  Scenario: Employment dates
    Given an employer respond yes to 'Are the dates of employment given by the claimant correct'
    When the completed Employment Tribunal response form is submitted
    Then I can download the ET3 form and validate in PDF format

  Scenario: Respondent answers to mandatory questions
    When an employer responds to mandatory questions
    Then I can download the ET3 form and validate in PDF format

  Scenario: Ignore special characters in Company's name
    When an employer responds to a claim with special characters in the company's name
    Then I can download the ET3 form and validate in PDF format

