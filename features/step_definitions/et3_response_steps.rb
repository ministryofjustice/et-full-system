# When(/^I submit a completed ET3 form$/) do
#   et3_helper.answer_all_questions
#   et3_helper.confirmation_of_supplied_details_page.submit_form
# end


# And(/^I take note of my ET3 reference number$/) do
#   @my_et3_reference = et3_helper.form_submission_page.reference_number.text
# end


When(/^the completed Employment Tribunal response form is submitted$/) do
  start_a_new_et3_response
  et3_answer_respondents_details
  et3_answer_claimants_details
  et3_answer_earnings_and_benefits
  et3_answer_defend_claim_question
  et3_answer_representative
  et3_employers_contract_claim
  et3_confiramtion_of_supplied_details

  @my_et3_reference = form_submission_page.reference_number.text
end