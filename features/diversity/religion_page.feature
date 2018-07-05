@wip @diversity @javascript

Feature: Religion page

Scenario: Successfully submit my religion
  Given I am on the religion page
  When I successfully submit my religion
  Then I should be taken to the ethnic group page

Scenario: Continue without providing an answer on my religion
  Given I am on the religion page
  When I continue without providing an answer to my religion
  Then I should be taken to the ethnic group page
