@e2e
@javascript
Feature:
  As an ATOS admin
  I want to be able to download completed forms
  So I can triage an employees claim against their employer

  Scenario: PDF format
    Given I am making a claim
    When I submit a completed Employment Tribunal form
    Then the completed form in PDF format is available for ATOS to download and validate

  Scenario: TXT format
    Given I am making a claim
    When I submit a completed Employment Tribunal form
    Then the completed form in TXT format is available for ATOS to download and validate

  Scenario: XML format
    Given I am making a claim
    When I submit a completed Employment Tribunal form
    Then the completed form in XML format is available for ATOS to download and validate

  Scenario: No representative
    Given I am making a claim with no respresentative
    When I submit a completed Employment Tribunal form
    Then the completed form in PDF format is available for ATOS to download and validate

  Scenario: One other person making claim
    Given I am making a claim with one other person
    When I submit a completed Employment Tribunal form
    Then the completed form in PDF format is available for ATOS to download and validate

  Scenario: Uploading CSV data when there are more than 7 other people making the claim
    Given I am making a claim with 7 other people
    When I submit a completed Employment Tribunal form
    Then the uploaded CSV data is formatted into a TXT format file and is available for ATOS to download

#   Scenario: Describing your claim details in a separate document
#     Given I am making a claim using a separate document
#     When I submit a completed Employment Tribunal form
#     Then the CSV file is stored in a landing folder

#   Scenario: Filename based on employer's business address
#     Given I am making a claim where my employer address is BS1 1DZ
#     When I submit a completed Employment Tribunal form
#     Then the filename should contain 1420000000000_ET1_Forename_Surname.txt

#   Scenario: Claim against more than one employer
#     Given I am making a claim against more than one employer
#     When I submit a completed Employment Tribunal form
#     Then the completed form in TXT format is available for ATOS to download and validate
