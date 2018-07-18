@e2e
@javascript
Feature:
  As a claimant submitting for unfair dismissal against my employer
  I want to recieve email notification of my application form
  So that I have a copy of it

  Scenario: Complete your claim
    Given I answered and continued from Saving your claim page
    Then I am notified via email that the claim has been started

  Scenario: Submitted application
    When I submit a completed ET1 form
    Then I am notified via email that the claim has been submitted
    And a copy of the application is attached in pdf format