@e2e
@javascript
Feature:
  As a claimant
  I would like to select whether I submit my application in Welsh or English
  So that I can use my preferred language

  Background: Apply Page
    Given a claimant is on the Apply page 

  Scenario: Verify copy content
    Then Your feedback copy text is in the correct language
    And Main header copy text is in the correct language
    And Are you in time copy text is in the correct language
    And Have you contacted Acas copy text is in the correct language
    And What you'll need copy text is in the correct language
    And Start a claim and Return to a claim copy text are in the correct language
    And Guide and Contact us links are showing in the correct language

  Scenario: 'Your feedback' link
    When user click on Your feedback link
    Then user is taken to the feedback page

  Scenario: 'Learn about when you can apply' link  
    When user click on Learn about when you can apply link
    Then user is taken to the time limits page

  Scenario: 'Acas early conciliaton certificate number' link
    When user click on Acas early conciliation certificate number
    Then user is taken to the Acas early conciliation page

  Scenario: Support links
    When user click on Guide link
    Then user is taken to the Guide page

    When user click on Contact us link
    Then user is taken to the Contact us page