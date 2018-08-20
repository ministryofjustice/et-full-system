@e2e
@javascript
Feature: ET3 response to local office
  As an ATOS admin
  I want to be able to download completed Employment Tribunal response form
  So I can triage an employers response made against them
  
   Scenario: No respresentative
    Given an employer responds to a claim with no respresentative
    When the completed Employment Tribunal response form is submitted
    Then I can download the ET3 form and validate in PDF format