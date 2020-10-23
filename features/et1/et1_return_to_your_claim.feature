@javascript
Feature:
  As a claimant
  I would like to select whether I submit my application in Welsh or English
  So that I can use my preferred language

  Scenario: Verify copy texts
    Given a claimant is on the Return to your claim page
    Then Return to your claim copy texts are displayed in the correct language
  
  Scenario: Find my claim
    Given I'm a return claimant
    When I enter my claim details
    Then I should be taken to where I was left off

  Scenario: Find my claim but lost password
    Given I'm a return claimant
    When I reset my password to "newpassword"
    And I enter my claim details
    Then I should be taken to where I was left off

  Scenario: Return to claim has invalid inputs
    Given I'm a return claimant
    When I enter my claim number but not my password
    Then I should see an error message pop up

  Scenario: Reset memorable word has invalid inputs
    Given I'm a return claimant
    When I forget my details and input the wrong email
    Then I should see an error message

  Scenario: 'Start a new claim' link
    Given a claimant is on the Return to your claim page
    When I click Start a new claim
    Then I should be taken to Start a new claim page
