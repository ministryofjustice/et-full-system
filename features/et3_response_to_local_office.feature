@e2e
@javascript
Feature: ET3 response to local office
  As an ATOS admin
  I want to be able to download completed Employment Tribunal response form
  So I can triage an employers response made against them

Scenario: TXT Format
  Given an employers response
  When the completed ET3 form is submitted
  Then I can download the ET3 form and validate in TXT format

  # Scenario: Create and send ET3 TXT file to claimant's local office
  #   Given I am the respondent "company01" with a unique first name
  #   When I submit a completed ET3 form
  #   And I take note of my ET3 reference number
  #   Then my entered data is formatted into a TXT format for my ET3 reference number and is available for ATOS to download
  
  # Scenario: Create ET3 PDF file and send to claimant's local office
  #   Given I am the respondent "company01" with a unique first name
  #   When I submit a completed ET3 form
  #   And I take note of my ET3 reference number
  #   Then my entered data is formatted into a PDF file for my ET3 reference number and is available for ATOS to download
