@wip @diversity @javascript

Feature: Type of claim page

Scenario: Successfully submits type of claim
  Given I am on the type of claim page
  When I successfully submit my type of claim
  Then I should be taken to the your identity page

Scenario: Continue without providing an answer on my type of claim
  Given I am on the type of claim page
  When I continue without providing an answer to my type of claim
  Then I should be taken to the your identity page
