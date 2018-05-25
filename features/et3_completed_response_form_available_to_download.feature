@e2e
@javascript
Feature: ET3 response to local office
  As an ATOS admin
  I want to be able to download completed Employment Tribunal response form
  So I can triage an employers response made against them

Scenario: TXT Format
  Given an employer responds to a claim
  When the completed Employment Tribunal response form is submitted
  Then I can download the ET3 form and validate in TXT format

Scenario: PDF Format
  Given an employer responds to a claim
  When the completed Employment Tribunal response form is submitted
  Then I can download the ET3 form and validate in PDF format
