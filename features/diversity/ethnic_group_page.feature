@wip @diversity @javascript

Feature: Ethnic group page

Scenario: Successfully submit my ethnic group
  Given I am on the ethnic group page
  When I successfully submit my ethnic group
  Then I should be taken to the disability page

Scenario: Continue without providing an answer on my ethnic group
  Given I am on the ethnic group page
  When I continue without providing an answer to my ethnic group
  Then I should be taken to the disability page

Scenario: Ethnic group is white
  Given I am on the ethnic group page
  When I select white as my ethnic group
  Then I am asked to specify which white group I belong to

Scenario: Ethnic group is mixed / multiple ethnic
  Given I am on the ethnic group page
  When I select mixed / multiple ethnic as my ethnic groups
  Then I am asked to specify which mixed / multiple ethnic groups I belong to

Scenario: Ethnic group is asian / asian british
  Given I am on the ethnic group page
  When I select asian / asian british as my ethnic group
  Then I am asked to specify which asian / asian british ethnic group I belong to

Scenario: Ethnic group is black / african / caribbean / black british
  Given I am on the ethnic group page
  When I select black / african / caribbean / black british as my ethnic group
  Then I am asked to specify which black / african / caribbean / black british ethnic group I belong to

Scenario: Ethnic group is other
  Given I am on the ethnic group page
  When I select other as my ethnic group
  Then I am asked to specify which other ethnic group I belong to

Scenario: Prefer not to say
  Given I am on the ethnic group page
  When I submit prefer not to say
  Then I should be taken to the disability page
