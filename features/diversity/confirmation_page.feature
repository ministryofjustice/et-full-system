@wip @diversity @javascript

Feature: Confirmation page

Background: Diversity confirmation of supplied details page
  Given I am on the diversity confirmation page

Scenario: Successfully submits
  When I submit my form
  Then I should be taken to the submission page

Scenario: Displays my answers
 Then I should see my answers to the questions

Scenario: Changing my answers
  When I change my answer on the disability page
  Then I should see my updated answer on the confirmation of supplied details page
