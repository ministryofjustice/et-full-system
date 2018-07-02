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
 
#  Scenario: No respresentative
#   Given an employer responds to a claim with no respresentative
#   When the completed Employment Tribunal response form is submitted
#   Then I can download the ET3 form and validate in PDF format

Scenario: Employment dates
  Given an employer responds to yes to emloyment start date
  When the completed Employment Tribunal response form is submitted
  Then I can download the ET3 form and validate in PDF format

Scenario: Filename based on case number
  Given an employer responds to a claim with case number starting '1454321/2017'
  When the completed Employment Tribunal response form is submitted
  Then I can download the ET3 form and validate that the filename starts with '14'

Scenario: Case number starting with 99 will be forwarded to the Default office
  Given an employer responds to a claim with case number starting '9954321/2017'
  When the completed Employment Tribunal response form is submitted
  Then I can download the ET3 form and validate that the filename starts with '99'

# Scenario: Respondent answers to mandatory questions
#   Given an employer responds to mandatory questions
#   Then I can download the ET3 form and validate in PDF format