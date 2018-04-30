@e2e
@javascript
Feature: ET1 Claim data is exported to the local office
  Scenario: 'Simple User' makes an ET1 claim with 1 representative and 1 respondent with an administrator validating the pdf comes out via the ATOS interface
    Given I am "simple_user" with a unique first name
    And I am the Claimant
    When I complete an online ET1 form and submit the form
    Then my entered data is formatted into a PDF format file and is available for ATOS to download

  Scenario: 'Simple User' makes an ET1 claim with 1 representative and 1 respondent with an administrator validating it comes out as a TXT file via the ATOS interface
    Given I am "simple_user" with a unique first name
    And I am the Claimant
    When I complete an online ET1 form and submit the form
    Then my entered data is formatted into a TXT format file and is available for ATOS to download

  Scenario: 'Simple User' makes an ET1 claim with 1 representative and 1 respondent with an administrator validating the xml comes out via the ATOS interface
    Given I am "simple_user" with a unique first name
    And I am the Claimant
    When I complete an online ET1 form and submit the form
    Then my entered data is formatted into an XML format file and is available for ATOS to download

  Scenario: 'Create and store ET1a TXT from CSV and send to local office with an administrator validating it comes out via the ATOS interface
    Given I am "simple_user_with_csv" with a unique first name
    And I am the lead claimant of more than 7 other claimants that I have listed in a spreadsheet
    When I complete an online ET1 form and submit the form
    Then my uploaded ET1 CSV data is formatted into a TXT format file and is available for ATOS to download

  Scenario: Send the ET1 CSV upload file to local office
    Given I am "simple_user_with_csv" with a unique first name
    When I complete an online ET1 form and submit the form
    Then the CSV file is stored in a landing folder
