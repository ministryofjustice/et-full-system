@et3 @javascript

Feature: Disability page

Background: ET3 disability page
  Given I am on the ET3 disability page

Scenario: Successfully submits whether I have a disability
  When I successfully submit whether I have a disability
  Then I should be taken to the employers contract claim page

Scenario: Proceed without answering earnings and benefits question
  When I click on next without providing whether I have a disability
  Then I should be taken to the employers contract claim page
