Given("a claimant is on Group claims page") do
  @claimant = FactoryBot.create(:claimant, :personal_details)
  start_a_new_et1_claim
  et1_answer_login
  et1_answer_claimant_questions
end

Then("Group claims page copy texts are displayed in the correct language") do
  expect(et1_group_claimants_page.has_correct_translation_on_group_claims?).to be true
end