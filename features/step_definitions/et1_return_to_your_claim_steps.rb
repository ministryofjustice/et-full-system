Given("a claimant is on the Return to your claim page") do
  load_start_page
  et1_new_claim_page.return_to_claim
end

Then("Return to your claim copy texts are displayed in the correct language") do
  expect(et1_return_to_your_claim_page.has_correct_translation?).to be true
end

Given("I'm a return claimant") do
  start_a_new_et1_claim
  claim_number = et1_identification_page.main_content.claims_number.text
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data, claim_number: claim_number)
  et1_answer_login
  load_start_page
  et1_new_claim_page.return_to_claim
end

When("I enter my claim details") do
  et1_return_to_your_claim_page.set_for(@claimants)
  et1_return_to_your_claim_page.find_my_claim
end

Then("I should be taken to where I was left off") do
  binding.pry
  et1_claimant_details_page.verify_claimants_details_page
end