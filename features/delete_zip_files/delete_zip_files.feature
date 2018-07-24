@javascript
Feature:
  As a tester
  I want to be able to delete zip files on a ad hoc basis
  So that I can have confident in my automated test when the files gets to large to download

  Scenario: Delete all zip files
   Given a list of zip files available for download
   Then I should be able to delete them all