@e2e
@javascript
Feature:
  As a claimant
  I would like to select whether I submit my application in Welsh or English
  So that I can use my preferred language

  Scenario: Apply Page in Welsh
    Given a claimant is on the Apply page in 'Welsh' 
    Then Your feedback copy text is in the correct language
    And Main header copy text is in the correct language
    And Are you in time copy text is in the correct language
    And Have you contacted Acas copy text is in the correct language
    And What you'll need copy text is in the correct language
    And Start a claim and Return to a claim copy text are in the correct language
    And Guide and Contact us links are showing in the correct language