@e2e
@javascript
Feature:
  As a claimant
  I would like to select whether I submit my application in Welsh or English
  So that I can use my preferred language

  Background: Apply Page in Welsh
    Given a claimant is on the Apply page in 'Welsh' 

  Scenario: Your feedback
    Then Your feedback copy text is in the correct language

  Scenario: Main Header
    Then Main header copy text is in the correct language

  Scenario: Content Block
    Then Are you in time copy text is in the correct language
    And Have you contacted Acas copy text is in the correct language
    And What you'll need copy text is in the correct language

  Scenario: Buttons
    Then Start a claim and Return to a claim copy text are in the correct language

  Scenario: Support
    Then Guide and Contact us links are showing in the correct language