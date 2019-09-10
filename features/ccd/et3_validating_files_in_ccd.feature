@e2e
@javascript
Feature:
  As a CCD
  I want to ensure that all files are sent correctly to CCD

  Scenario: Make a basic response to an existing claim
    Given an employer responds to an existing claim
    When the completed Employment Tribunal response form is submitted
    Then the response files should be present in the existing ccd claim
