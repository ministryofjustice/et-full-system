Given("a claimant is on Claimant's details page") do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  start_a_new_et1_claim
  et1_answer_login
end

Then("Claimant's details page copy texts are displayed in the correct language") do
  expect(et1_claimant_details_page.has_correct_translation?).to be true
end

When("I answerd Yes to disability") do
  data = @claimants[0]
  et1_claimant_details_page.main_content.title.set(data[:title])
  et1_claimant_details_page.main_content.first_name.set(data[:first_name])
  et1_claimant_details_page.main_content.last_name.set(data[:last_name])
  et1_claimant_details_page.main_content.date_of_birth.set(data[:date_of_birth])
  et1_claimant_details_page.main_content.gender.set(data[:gender])
  et1_claimant_details_page.main_content.claiman_has_special_needs.set(data[:has_special_needs])
  #TODO - not sure why this is not working! argh!
  et1_claimant_details_page.main_content.assistance.special_needs.set(data[:special_needs])
end

Then("I should see the option to describe the assistant I need") do
  expect(et1_claimant_details_page.has_correct_translation_for_assistance_required?).to be true
end