@e2e
@javascript
Feature:
  As a claimant
  I would like to select whether I submit my application in Welsh or English
  So that I can use my preferred language

  Background: Claimant's details page
    Given a claimant is on Claimant's details page 

  Scenario: Verify copy texts
    Then Claimant's details page copy texts are displayed in the correct language

  Scenario: Yes to disability
    When I answerd Yes to disability
    Then I should see the option to describe the assistant I need

  Scenario: Outside United Kingdom
    Then I should be able to select Outside United Kingdom as country of residence

  Scenario: Mandatory field validation errors
    When I submit without answering any questions
    Then I should see mandatory errors on the Claimant's details page

  Scenario: blank email address
    When leaving an email address field blank
    Then I should see an error message for leaving email address field blank
    
  Scenario: invalid email address
    When entering an invalid email address
    Then I should see an error message for entering invalid email address

  # Scenario: Save and complete later
  #   When I click on Save and complete later
  #   Then I should be able to return to where I was left off

  # Scenario: Print this page
  #   Then I should be able to print this page  