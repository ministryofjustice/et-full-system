@javascript
Feature: Diversity monitoring questionnaire
  As a Claimant
  I want, after submitting an online ET1 Claim form, to be able to participate in the online Diversity questionnaire
  So that I can enter my details into a Diversity Survey form

  Scenario: Load Diversity questionnaire from ET1 confirmation page
    Given an employee making a claim
    When the completed form is submitted
    Then I should be able to load diversity questionnaire form page

  Scenario: An empty form is valid as a survey participant
    Given a claimant answered all blank questions on the survey participant form
    When the completed Diversity questionnaire form is submitted
    Then I should see participant survey populated in ET-Admin Diversity Responses page

  Scenario: All questions answered
    Given a claimant answered all questions on the survey participant form
    When the completed Diversity questionnaire form is submitted
    Then I should be on the Thank you page
    And I should see participant survey populated in ET-Admin Diversity Responses page

  # Scenario: Edit your answers
  #   Given a claimant answered all questions on the survey participant form
  #   When user edit 'What is your ethnic group' to 'prefer not to say'
  #   Then the data is stored 'prefer not to say' 

  # Scenario: Previous your answers
  #   Given a Claimant answered all fields on the Diversity questionnaire form
  #   When user click on previous button
  #   And edit 'Which age group are you in?' to 'prefer not to say'
  #   Then the data is stored in et1 database as 'prefer not to say' with timestamp created

  # Scenario: Other relevant links
  #   Given I am on the Diversity questionnaire form page
  #   Then I should see Other relevant links