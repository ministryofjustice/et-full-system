@wip @diversity @javascript

Feature: Diversity landing page

Scenario: Successfully starts diversity questionnaire
  Given I am on the diversity landing page
  When I click on the start now button
  Then I should be taken to the type of claim page

Scenario: Timeout message
  Given I am on the diversity landing page
  Then I should see timeout message
