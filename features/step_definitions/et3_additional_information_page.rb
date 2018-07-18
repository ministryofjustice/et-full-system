Given(/^I am on the ET3 additional information page$/) do
  @respondent = FactoryBot.create_list(:et3_respondent, 1, :et3_respondent_answers, :upload_additional_information)
  @claimant = FactoryBot.create_list(:et3_claimant, 1, :agree_with_employment_dates)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
  start_a_new_et3_response
  et3_answer_respondents_details
  et3_answer_claimants_details
  et3_answer_earnings_and_benefits
  et3_answer_defend_claim_question
  et3_answer_representative
  et3_employers_contract_claim
  expect(additional_information_page).to be_displayed
end

When(/^I successfully upload my file with additional information$/) do
  additional_information
end

When(/^I click on next without providing the additional information$/) do
  additional_information_page.next
end

Then(/^I should see my file has been added$/) do
#   TODO
end

Then(/^I should be taken to the confirmation of supplied details page$/) do
  expect(confirmation_of_supplied_details_page).to be_displayed
end