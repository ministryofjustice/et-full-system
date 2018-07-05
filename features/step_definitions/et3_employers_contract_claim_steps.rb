Given(/^I am on the ET3 employers contract claim page$/) do
  @respondent = FactoryBot.create_list(:et3_respondent, 1, :et3_respondent_answers)
  @claimant = FactoryBot.create_list(:et3_claimant, 1, :agree_with_employment_dates)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
  start_a_new_et3_response
  et3_answer_respondents_details
  et3_answer_claimants_details
  et3_answer_earnings_and_benefits
  et3_answer_defend_claim_question
  et3_answer_representative
end

Given(/^I successfully submit whether I wish to make an employers contract claim$/) do
  et3_employers_contract_claim
end

Given(/^I should be taken to the additional information page$/) do
  expect(additional_information_page).to be_displayed
end
