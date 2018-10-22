@e2e
@javascript
Feature:
  As Group claims page
  I want to ensure that user can submit their Group claims in Welsh or in English

  Background: Group claims page
    Given a claimant is on Group claims page 

  Scenario: Verify copy texts
    Then Group claims page copy texts are displayed in the correct language

  Scenario: No to other people making claims
    When I submit no other people are making claims
    Then I should be on the Respresentative's details page

  Scenario: Verify copy text for 5 or few claimants
    When there are group claimants
    Then I should see copy texts correctly dispayed for group claimants

  Scenario: Three Claimants
    Given two employees making a claim
    Then I should be able to submit two claimants details

  # Scenario: Add more claimants
  #   When there are group claimants
  #   And I enter my claimant 2 details
  #   Then I can add more claimants
    
  # Scenario: Upload user details in separate spreadsheet
  #   When there are group claimants
  #   Then I should be able to upload groups claims in csv file

  # Scenario: Spreadsheet for group claim copy text
  #   When I answered Yes to uploading user details in separate spreadsheet
  #   Then I can verify that the copy text on the spreadsheet for group claim are correct

  # Scenario: Download spreadsheet template
  #   When I'm on Spreadsheet for group claim
  #   Then I should be able to download spreadsheet template

  # Scenario: Submit group claims via separate spreadsheet
  #   Then I should be able to upload and submit a group claims via separate spreadsheet