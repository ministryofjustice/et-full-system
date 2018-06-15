When(/^the completed Employment Tribunal response form is submitted$/) do
  start_a_new_et3_response
  et3_answer_respondents_details
  et3_answer_claimants_details
  et3_answer_earnings_and_benefits
  et3_answer_defend_claim_question
  @representative[0].have_representative == 'Yes' ? et3_answer_representative : your_representative_page.next
  et3_employers_contract_claim
  et3_confiramtion_of_supplied_details

  @my_et3_reference = form_submission_page.reference_number.text
end