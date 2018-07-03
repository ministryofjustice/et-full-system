When(/^the completed Employment Tribunal response form is submitted$/) do
  start_a_new_et3_response
  et3_answer_respondents_details
  et3_answer_claimants_details
  et3_answer_earnings_and_benefits
  et3_answer_defend_claim_question
  @representative[0].have_representative == 'Yes' ? et3_answer_representative : your_representative_page.next
  et3_employers_contract_claim
  additional_information_page.next
  et3_confiramtion_of_supplied_details

  @my_et3_reference = form_submission_page.reference_number.text
end

Given(/^an employer responds to mandatory questions$/) do
  @claimant = FactoryBot.create_list(:et3_claimant, 1, :et3_claimant_optionals)
  @respondent = FactoryBot.create_list(:et3_respondent, 1, :et3_respondent_optionals)
  @representative = FactoryBot.create_list(:representative, 1, :et3_no_representative)

  start_a_new_et3_response
  et3_answer_respondents_details

  user = @claimant[0]
  claimants_details_page.agree_with_employment_dates_question.set_for(user)
  claimants_details_page.next
  earnings_and_benefits_page.next
  response_page.defend_claim_question.set_for(user)
  response_page.next

  @representative[0].have_representative == 'Yes' ? et3_answer_representative : your_representative_page.next
  employers_contract_claim_page.next
  additional_information_page.next
  confirmation_of_supplied_details_page.next

  @my_et3_reference = form_submission_page.reference_number.text
end