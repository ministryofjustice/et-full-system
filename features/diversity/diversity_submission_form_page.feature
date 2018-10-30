@diversity
@javascript
Feature:
  As a claimant on the Submission Form page
  I would like to select whether I submit my diversity info in Welsh or English
  So that I can use my preferred language

  Background: Submission Form page
    Given a claimant is on the Submission Form page

  Scenario: Verify page copy
    Then Submission Form page copy texts are displayed in the correct language
