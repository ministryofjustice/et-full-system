@et3 @javascript 

Feature: Employers contract claim page

Background: ET3 employers contract claim page
  Given I am on the ET3 employers contract claim page

Scenario: Successfully submits
  When I successfully submit whether I wish to make an employers contract claim
  Then I should be taken to the confirmation of supplied details page