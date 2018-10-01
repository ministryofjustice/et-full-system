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

  Scenario: Filename based on respondent's work address
    Given a claimant submitted an ET1 form without providing a work address 'BS11DZ' 
    Then the address lookup will be based on respondent's work address and will forwarded to 'Bristol Civil and Family Justice Centre, 2 Redcliff Street, Bristol, BS1 6GR'
    And I can download the form and validate that the filname start with '14'

  Scenario: Filename based on respondent's work address is unknown
    Given a claimant submitted an ET1 form without providing a work address 'Z12LL'
    Then the address lookup will be based on respondent's work address and will forwarded to 'Alexandra House, 14-22 The Parsonage, Manchester M3 2JA'
    And I can download the form and validate that the filname start with '99'

  Scenario: Filename based on claimants work address
    Given a claimant submitted an ET1 form with work address WD187SQ
    Then the address lookup will be based on claimant's work address and will be forwarded to '3rd Floor, Radius House, 51 Clarendon Rd, Watford, WD17 1HP'
    And I can download the form and validate that the filname start with '33'

  Scenario: Ignore special characters in first and last name when generating filenames
    When a claimant submitted an ET1 with special characters in the first and last name 
    Then I can download the form and validate in PDF format
  
  # fixed as part of this ticket - RST-1423-break-line
  # Scenario: Submission details includes RTF and CSV files
  #   Given a group claimaints submitting an ET1 form by uploading CSV and Rich Text Format documents
  #   When the completed form is submitted
  #   Then submission details page includes RTF and CSV files