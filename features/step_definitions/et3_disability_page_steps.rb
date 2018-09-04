Given(/^I am on the ET3 disability page$/) do
  @respondent = FactoryBot.create_list(:et3_respondent, 1, :et3_respondent_answers)
  @claimant = FactoryBot.create_list(:et3_claimant, 1, :agree_with_employment_dates)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
  start_a_new_et3_response
  et3_answer_respondents_details
  et3_answer_claimants_details
  et3_answer_earnings_and_benefits
  et3_answer_defend_claim_question
  et3_answer_representative
  expect(disability_page).to be_displayed
end

When(/^I successfully submit whether I have a disability$/) do
  et3_answer_disability_question
end

When(/^I click on next without answering the disability question$/) do
  disability_page.next
end

Then(/^I should be taken to the employers contract claim page$/) do
  expect(employers_contract_claim_page).to be_displayed
end
