@e2e
@javascript
Feature:
  As Representative's details page
  I want to ensure that user can submit their Representative's details in Welsh or in English

  Background: Representative's details page
    Given a claimant is on Representative's details page 

  Scenario: Verify copy texts on Representative's details page
    Then Representative's details page copy texts are displayed in the correct language

  Scenario: No to representative
    When I submit a claim without any representative
    Then I should be taken to Respondent's details page

  Scenario: Verify all copy text for there yes to representative
    When I answer yes to representative
    Then I can verify that copy texts correctly dispayed for yes to representative

  Scenario: Mandatory field validation errors
    When I submit without answering any representative questions
    Then I should see mandatory errors on the Representative's details page

  Scenario: Verify all type of representative values 
    When I select down list for type of representative
    Then I can verify that all type of representative values are correctly displayed

  Scenario: What is a DX number?
    When I click on DX number
    Then I can verify that DX copy texts are correctly displayed

  Scenario: Invalid Date of birth error
    When I submit an invalid date of birth for claimant details page
    Then I should see an invalid error message for date of birth claimant details page

  Scenario: Invalid UK postcode error message
    When entering 'UTOI&*"?£$' postcode for Representative's details page
    Then I should see an error message for invalid UK postcode please use SW55 9QT Representative's details page