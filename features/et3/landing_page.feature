@et3 @javascript

Feature: Response to claim landing page

Background: ET3 landing page
  Given I am on the ET3 landing page

Scenario: Begin this form
  When I click on the begin this form button
  Then I should be taken to the respondents details page
  