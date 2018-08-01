@et3 @javascript

Feature: ET3 landing page

Background: ET3 landing page
  Given I am on the ET3 landing page

Scenario: Begin this form
  When I click on the begin this form button
  Then I should be taken to the respondents details page

Scenario: Other relevant links
  Then I should see other relevant links
  