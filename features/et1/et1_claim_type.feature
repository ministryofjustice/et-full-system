@javascript
Feature:
  As About the claim page
  I want to ensure that user can submit their About the claim in Welsh or in English

  Background: About the claim page
    Given a claimant is on About the claim page 

  Scenario: Verify copy text for About the claim page
    Then I can verify that the copy text on About the claim page displayed correctly