@e2e
@javascript
@local
Feature:
  As a claimant applying for unfair dismissal against my employer
  I want to receive copies of my application form
  So that I have a record of it

  Scenario: Save and continue from the login page
    Given I answered and continued from the login page
    Then I am notified via email the claimant number
    And that the claim has been saved

  Scenario: Submitted application
    When I submit a completed ET1 form
    Then I am notified via email that the claim has been submitted
    And a copy of the application is attached in pdf format