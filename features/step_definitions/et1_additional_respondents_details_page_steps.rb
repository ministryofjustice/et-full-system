Given("a claimant is on Additional respondent's details page") do
  @claimants = FactoryBot.create_list(:claimant, 1, :person_data)
  @representatives = FactoryBot.create_list(:representative, 1, :et3_information)
  @respondents = FactoryBot.create_list(:acas_number_reason, 1, :no_acas)
  start_a_new_et1_claim
  et1_answer_login
  et1_answer_claimant_questions
  et1_answer_group_claimants_questions
  et1_answer_representatives_questions
  et1_respondents_details_page.set(@respondents)
  et1_respondents_details_page.save_and_continue
end

Then("I can verify that the copy text on Additional respondent's details page displayed correctly") do
  expect(et1_additional_respondents_details_page.has_correct_translation?).to be true
end