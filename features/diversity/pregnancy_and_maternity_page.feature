@wip @diversity @javascript

Feature: Pregnancy and maternity page

Scenario: Successfully submit whether I was pregnant
  Given I am on the pregnancy and maternity page
  When I successfully submit whether I was pregnant
  Then I should be taken to the confirmation page

Scenario: Continue without providing an answer on whether I was pregnant
  Given I am on the pregnancy and maternity page
  When I continue without providing an answer to whether I was pregnant
  Then I should be taken to the confirmation page
