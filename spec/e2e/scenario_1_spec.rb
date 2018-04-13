require 'spec_helper'

RSpec.describe 'Scenario 1', type: :feature, js: true do
  example 'Dummy user is a big one - lets see what it does' do
    given_i_am(:dummy_user)

    start_a_new_et1_claim

    et1_answer_login
    et1_answer_claimant_questions
    et1_answer_group_claimants_questions
    et1_answer_representatives_questions
    et1_answer_respondents_questions
    et1_answer_employment_details_questions
    et1_answer_claim_type_questions
    et1_answer_claim_details_questions
    et1_answer_claim_outcome_questions
    et1_answer_more_about_the_claim_questions

    et1_submit_claim
  end

  example 'Simple user is a simpler one - lets see what it does' do
    given_i_am(:simple_user)

    start_a_new_et1_claim

    et1_answer_login
    et1_answer_claimant_questions
    et1_answer_group_claimants_questions
    et1_answer_representatives_questions
    et1_answer_respondents_questions
    et1_answer_employment_details_questions
    et1_answer_claim_type_questions
    et1_answer_claim_details_questions
    et1_answer_claim_outcome_questions
    et1_answer_more_about_the_claim_questions

    et1_submit_claim

    within_admin_window do
      admin_pages.atos_files_page.load
      file_count_before = admin_pages.atos_files_page.file_count
      admin_pages.jobs_page.run_export_claims_cron_job
      get_page_count = -> {
        admin_pages.atos_files_page.load
        admin_pages.atos_files_page.file_count
      }
      expect(&get_page_count).to eventually(be > file_count_before)
    end
  end
end