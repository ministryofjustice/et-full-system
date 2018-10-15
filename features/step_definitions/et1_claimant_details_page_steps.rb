Given("a claimant is on Claimant's details page") do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  start_a_new_et1_claim
  et1_answer_login
end

Then("Claimant's details page copy texts are displayed in the correct language") do
  expect(et1_claimant_details_page.has_correct_translation?).to be true
end

When("I answerd Yes to disability") do
  et1_claimant_details_page.main_content.title.set('Mrs')
  et1_claimant_details_page.main_content.first_name.set('Sivvoy')
  et1_claimant_details_page.main_content.last_name.set('Taing')
  et1_claimant_details_page.main_content.date_of_birth.set('21/11/1982')
  et1_claimant_details_page.main_content.gender.set('Prefer not to say')
  et1_claimant_details_page.main_content.claiman_has_special_needs.set('Yes')
  #TODO - not sure why this is not working! argh!
  et1_claimant_details_page.main_content.assistance.special_needs.set("hello world")
end

Then("I should see the option to describe the assistant I need") do
  expect(et1_claimant_details_page.has_correct_translation_for_assistance_required?).to be true
end


# When("user click on Your feedback link") do
#   et1_apply_page.feedback_notice.feedback_link.click
# end

# Then("user is taken to the feedback page") do
#   expect(et1_your_feedback_page.header.text).to be_truthy
# end

# When("user click on Learn about when you can apply link") do
#   et1_apply_page.learn_how_to_apply
# end

# Then("user is taken to the time limits page") do
#   expect(et1_guide_page.has_correct_translation_for_time_limits?).to be true
# end

# When("user click on Acas early conciliation certificate number") do
#   et1_apply_page.acas_certificate_number
# end

# Then("user is taken to the Acas early conciliation page") do
#   expect(et1_guide_page.has_correct_translation_for_acas_early_conciliation?).to be true
# end