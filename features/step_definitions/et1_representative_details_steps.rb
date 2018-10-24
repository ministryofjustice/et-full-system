Given("a claimant is on Representative's details page") do
  @claimants = FactoryBot.create_list(:claimant, 1, :person_data)
  @representatives = FactoryBot.create_list(:representative, 1, :et3_information)
  start_a_new_et1_claim
  et1_answer_login
  et1_answer_claimant_questions
  et1_answer_group_claimants_questions
end

Then("I can verify that the copy text on Representative's details page displayed correctly") do
  et1_representatives_details_page.main_content.representative.yes.click
  expect(et1_representatives_details_page.has_correct_translation?).to be true
end

When("I submit a claim without any representative") do
  et1_answer_representatives_questions
end

Then("I should be taken to Respondent's details page") do
  expect(et1_respondents_details_page.main_header).to have_page_header
end

When("I submit without answering any representative questions") do
  et1_representatives_details_page.main_content.representative.yes.click
  et1_representatives_details_page.save_and_continue
end

Then("I can verify that validation error messages are shown on the Representative's details page") do
  expect(et1_representatives_details_page.has_correct_validation_error_message?).to be true
end