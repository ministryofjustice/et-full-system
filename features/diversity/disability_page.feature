@wip @diversity @javascript

Feature: Disability page

Scenario: Successfully submit whether I have a disability
  Given I am on the disability page
  When I successfully submit whether I have a disability
  Then I should be taken to the pregnancy and maternity page

Scenario: Continue without providing an answer on my ethnic group
  Given I am on the ethnic group page
  When I continue without providing an answer to my ethnic group
  Then I should be taken to the pregnancy and maternity page
