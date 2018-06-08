@e2e
@javascript
Feature:
  As an ATOS admin
  I want to be able to download completed Employment Tribunal forms
  So I can triage an employees claim against their employer

  Scenario: PDF format
    Given an employee making a claim
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: TXT format
    Given an employee making a claim
    When the completed form is submitted
    Then I can download the form and validate in TXT format

  Scenario: XML format
    Given an employee making a claim
    When the completed form is submitted
    Then I can download the form and validate in XML format

  Scenario: No representative
    Given an employee making a claim without a respresentative
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: 2 people making a claim
    Given 2 employees making a claim
    When the completed form is submitted
    Then I can download the form and validate in PDF format

  Scenario: Validate TXT file when uploading CSV data
    Given 7 employees making a claim by uploading CSV file
    When the completed form is submitted
    Then I can download the uploaded CSV data and validate in TXT format

  Scenario: Validate CSV file when uploading CSV data
    Given 7 employees making a claim by uploading CSV file
    When the completed form is submitted
    Then I can download the uploaded CSV data and validate in CSV format

  Scenario: Uploading RTF data when describing your claim in details
    Given an employee making a claim by uploading a RTF document
    When the completed form is submitted
    Then I can download the form and validate in RTF format

  Scenario: Making claim against 3 employers
    Given an employee making a claim against 3 employers
    When the completed form is submitted
    Then I can download the form and validate the TXT file contained 3 employers details

 Scenario: Filename based on claimants work address
   Given claimant work address is BS11DZ
   When the completed form is submitted
   Then I can download the form and validate that the filname start with 14