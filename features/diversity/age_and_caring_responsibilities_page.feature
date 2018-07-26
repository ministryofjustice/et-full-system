@wip @diversity @javascript

Feature: Age and caring responsibilities page

Scenario: Successfully submits age and caring responsibilities
  Given I am on the age and caring responsibilities page
  When I successfully age and caring responsibilities
  Then I should be taken to the religion page

Scenario: Continue without providing an answer on my age and caring responsibilities
  Given I am on the age and caring responsibilities page
  When I continue without providing an answer to my age and caring responsibilities
  Then I should be taken to the religion page
