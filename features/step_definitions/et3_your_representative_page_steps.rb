Given(/^I am on the ET3 your representative page$/) do
  @respondent = FactoryBot.create(:et3_respondent)
  @claimant = FactoryBot.create(:et3_claimant)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
  start_a_new_et3_response
  et3_answer_respondents_details
  et3_answer_claimants_details
  et3_answer_earnings_and_benefits
  et3_answer_defend_claim_question
  expect(your_representative_page).to be_displayed
end

When(/^I successfully submit whether I have a representative$/) do
  et3_answer_representative
end

When(/^I click on next without providing whether I have a representative$/) do
  your_representative_page.next
end

Then(/^I should be taken to my employers contract claim page$/) do
  expect(employers_contract_claim_page).to be_displayed
end