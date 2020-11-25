@et1
@javascript
Feature:
  As a claimant
  I would like to select whether I submit my application in Welsh or English
  So that I can use my preferred language

  Background: Apply page
    Given a claimant is on the Your feedback page 

  Scenario: Verify copy texts
    Then Your feedback page copy texts are displayed in the correct language
  
  Scenario: Submit a feedback
    When I submit Your feedback delaying 4 seconds
    Then I should see thank you on your feedback message
    And email notification came from anonymous person

  Scenario: Email notification
    When I submit Your feedback form with a valid email address delaying 4 seconds
    Then I should see user's email address shown in the address form
