Given(/^I am on the ET3 earnings and benefits page$/) do
  @respondent = FactoryBot.create(:et3_respondent)
  @claimant = FactoryBot.create(:et3_claimant)
  start_a_new_et3_response
  et3_answer_respondents_details
  et3_answer_claimants_details
  expect(earnings_and_benefits_page).to be_displayed
end

When(/^I successfully submit information about my earnings and benefits$/) do
  et3_answer_earnings_and_benefits
end

Then(/^I should be taken to the response page$/) do
  expect(response_page).to be_displayed
end

When(/^I click on next without providing the optional earnings and benefits details$/) do
  earnings_and_benefits_page.next
end