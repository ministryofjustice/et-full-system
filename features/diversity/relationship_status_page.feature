@wip @diversity @javascript

Feature: Relationship status page

Scenario: Successfully submits relationship status
  Given I am on the relationship status page
  When I successfully submit my relationship status
  Then I should be taken to my age group page

Scenario: Continue without providing an answer on my relationship status
  Given I am on the relationship status page
  When I continue without providing an answer to my relationship status
  Then I should be taken to my age group page
