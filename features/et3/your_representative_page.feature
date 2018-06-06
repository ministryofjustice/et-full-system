@et3 @javascript

Feature: Your representative page

Background: ET3 your representative page
  Given I am on the ET3 your representative page

Scenario: Successfully submit whether I have a representative
  When I successfully submit whether I have a representative
  Then I should be taken to my employers contract claim page

Scenario: Does not provide whether I have a representative
  When I click on next without providing whether I have a representative
  Then I should be taken to my employers contract claim page