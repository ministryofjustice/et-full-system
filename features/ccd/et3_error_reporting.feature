@e2e
@javascript
Feature:
  As a CCD administrator
  I want to ensure that I am aware of temporary and permanent problems in the transmission
  of data to CCD for an ET3 response

  @local
  Scenario: Submitting a response which will report successful export to ccd
    Given an employer responds to an existing claim
    When the completed Employment Tribunal response form is submitted
    And the submitted Employment Tribunal response is exported to ccd for me
    Then the response in the admin should show that the export sent to CCD

