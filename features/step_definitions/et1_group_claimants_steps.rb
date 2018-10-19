Given("a claimant is on Group claims page") do
  @claimant = FactoryBot.create(:claimant, :personal_details)
  start_a_new_et1_claim
  et1_answer_login
  et1_answer_claimant_questions
end

Then("Group claims page copy texts are displayed in the correct language") do
  expect(et1_group_claimants_page.has_correct_translation_on_group_claims?).to be true
end

When("I submit no other people are making claims") do
  et1_group_claimants_page.main_content.additional_claimants_of_collection_type.set(:"simple_form.no")
  et1_group_claimants_page.save_and_continue
end

Then("I should be on the Respresentative's details page") do
  expect(et1_representatives_details_page.main_header).to have_page_header
end