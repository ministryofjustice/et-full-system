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

  Scenario: RTF format
    Given an employee making a claim by uploading a Rich Text Format document
    When the completed form is submitted
    Then I can download the form and validate in Rich Text format

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

  Scenario: Making claim against 3 employers
    Given an employee making a claim against 3 employers
    When the completed form is submitted
    Then I can download the form and validate the TXT file contained 3 employers details

  Scenario: Ignore special characters in first and last name when generating filenames
    When a claimant submitted an ET1 with special characters in the first and last name 
    Then I can download the form and validate in PDF format

  Scenario: No employment details
    Given a claimant submitted an ET1 with no employment details
    When the completed form is submitted
    Then  I can download the form and validate in PDF format
  
  Scenario: Submission details includes RTF and CSV files
    Given a group claimaints submitting an ET1 form by uploading CSV and Rich Text Format documents
    When the completed form is submitted
    Then submission details page includes RTF and CSV files

  Scenario: claimaint's address is outside UK
    Given a claimant submitted an ET1 who live outside UK
    When the completed form is submitted
    Then  I can download the form and validate in PDF format