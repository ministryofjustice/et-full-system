@et3 @javascript 

Feature: Additional information page

Background: ET3 additional information page
  Given I am on the ET3 additional information page

Scenario: Successfully upload my file with additional information
  When I successfully upload my file with additional information
  Then I should see my file has been added

Scenario: Proceed without uploading additonal inforamtion
  When I click on next without providing the additional inforamtion
  Then I should be taken to the confirmation of supplied details page
  