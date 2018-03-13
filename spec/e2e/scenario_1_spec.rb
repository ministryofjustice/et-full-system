require 'spec_helper'

RSpec.describe 'Scenario 1', type: :feature, js: true do
  example 'It does something' do
    given_i_am(:anonymous)
    user.email_address = 'test@digital.justice.gov.uk'
    user.memorable_word = 'password'

    start_a_new_et1_claim

    et1_answer_login

    et1_answer_claimant_details

    et1_answer_group_claimants_questions

    et1_answer_representatives_questions

    et1_answer_respondents_questions

    et1_answer_employment_details_questions

    et1_answer_claim_type_questions

    et1_answer_claim_details_questions

    et1_answer_claim_outcome_questions

    et1_answer_more_about_the_claim_questions

    et1_save_a_copy_of_claim

    validate_presence_of_files


  end
end