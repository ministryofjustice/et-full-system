@e2e
@javascript
Feature:
  As an ATOS admin
  I want to be able to download completed Employment Tribunal forms
  So I can triage an employees claim against their employer

  Scenario: PDF format
    Given an employee making a claim
    When the completed form is submitted
    Then I can download the form in PDF format

  Scenario: TXT format
    Given an employee making a claim
    When the completed form is submitted
    Then I can download the form in TXT format

  Scenario: XML format
    Given an employee making a claim
    When the completed form is submitted
    Then I can download the form in XML format

  Scenario: No representative
    Given an employee making a claim without a respresentative
    When the completed form is submitted
    Then I can download the form in PDF format

  Scenario: 2 people making a claim
    Given 2 employees making a claim
    When the completed form is submitted
    Then I can download the form in PDF format

  Scenario: Validate TXT file when uploading CSV data
    Given 7 employees making a claim by uploading CSV file
    When the completed form is submitted
    Then I can download the uploaded CSV data in TXT format

  Scenario: Validate CSV file when uploading CSV data
    Given 7 employees making a claim by uploading CSV file
    When the completed form is submitted
    Then I can download the uploaded CSV data in CSV format

  Scenario: Uploading RTF data when describing your claim in details
    Given an employee making a claim by uploading a RTF document
    When the completed form is submitted
    Then I can download the form in RTF format

  Scenario: Making claim against 3 employers
    Given an employee making a claim against 3 employers
    When the completed form is submitted
    Then I can download the form in TXT format

# Scenario: Filename based on employer's business address
#   Given I am making a claim where my employer address is BS1 1DZ
#   When I submit a completed Employment Tribunal form
#   Then the filename should contain 1420000000000_ET1_Forename_Surname.txt


