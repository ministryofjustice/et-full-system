@e2e
@javascript
Feature:
  As a claimant
  I would like to select whether I submit my application in Welsh or English
  So that I can use my preferred language

  Scenario: Apply Page in Welsh
    Given a claimant is on the Apply page in 'Welsh'
    Then I should see all copy text in 'Welsh' language