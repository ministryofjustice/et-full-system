@e2e
@javascript
Feature:
  As a claimant
  I would like to select whether I submit my application in Welsh or English
  So that I can use my preferred language

  Background: Return to your claim
    Given a claimant is on the Return to your claim page 

  Scenario: Verify copy texts
    Then Return to your claim copy texts are displayed in the correct language
  
  # TODO
  # Scenario: Find my claim
  #   When I submit my claim details
  #   Then I should be on where I was left off

  # Scenario: 'Start a new claim' link
  #   When I realised I don't have these details on me
  #   When I click on Start a new claim
  #   Then I should be taken to Start a new claim page