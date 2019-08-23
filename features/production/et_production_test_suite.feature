@e2e
@javascript
Feature:
  As a Tester I want to check with Dan Thompson what postcode to use before running the automated test below
  So that only ET1 and ET3 forms are sent to manchester (M1 1AQ) or Glasgow (G1 2FF)
  And that Dan Thompson can verified that the everything is working as expected

  Scenario: ET1 very basic details submitted to Manchester (M1 1AQ)
    Given a DUMMY USER making a claim
    When the completed form is submitted
    Then the claim should be present in CCD
    And the claim should be present in ATOS

  Scenario: ET1 Multiple claimaints - RTF, PDF and CSV format submitted to Manchester (M1 1AQ)
    Given a DUMMY USER submitting an ET1 form by uploading CSV and RTF documents
    When the completed form is submitted
    Then the multiple claimaints should be present in CCD
    And the claim should be present in ATOS

  Scenario: ET3 - very basic details submitted to Manchester (M1 1AQ)
    Given a DUMMY USER responds to a claim
    Then I can download the ET3 form and validate in PDF format