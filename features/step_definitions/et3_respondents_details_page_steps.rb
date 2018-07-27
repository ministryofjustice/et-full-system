Given(/^I am on the ET3 respondents details page$/) do
  @respondent = FactoryBot.create_list(:et3_respondent, 1, :et3_respondent_answers)
  start_page.load
  start_page.next
  expect(respondents_details_page).to be_displayed
end

When(/^I successfully submit all the respondents details$/) do
  et3_answer_respondents_details
end

When(/^I successfully submit the required respondents details only$/) do
  et3_answer_required_espondents_details
end

Then(/^I should be taken to the claimants details page$/) do
  expect(claimants_details_page).to be_displayed
end

When(/^I click on next without providing the required respondents details$/) do
  respondents_details_page.next
end

Then(/^I should see the error message saying the respondents details cant be blank$/) do
  expect(respondents_details_page).to have_error_header
  expect(respondents_details_page.case_number_question).to have_error_invalid
  expect(respondents_details_page.name_question).to have_error_blank
  expect(respondents_details_page.building_name_question).to have_error_blank
  expect(respondents_details_page.street_question).to have_error_blank
  expect(respondents_details_page.town_question).to have_error_blank
  expect(respondents_details_page.postcode_question).to have_error_blank
  expect(respondents_details_page.organisation_more_than_one_site_question).to have_inclusion
end
