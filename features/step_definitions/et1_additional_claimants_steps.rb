Given("a claimant is on Group claims page") do
  @claimant = FactoryBot.create(:claimant, :personal_details)
  start_a_new_et1_claim
  et1_answer_login
  et1_answer_claimant_questions
end

Then("Group claims page copy texts are displayed in the correct language") do
  expect(et1_group_claimants_page.has_correct_translation_on_group_claims?).to be true
end

# When("I answerd Yes to disability") do
#   et1_claimant_details_page.main_content.claiman_has_special_needs.set(@claimant[:has_special_needs])
#   et1_claimant_details_page.main_content.assistance.special_needs.set(@claimant[:special_needs])
# end

# Then("I should see the option to describe the assistant I need") do
#   expect(et1_claimant_details_page.has_correct_translation_for_assistance_required?).to be true
# end

# Then("I should be able to select Outside United Kingdom as country of residence") do
#   claimant = FactoryBot.create(:claimant, :personal_details, country: :"simple_form.options.claimant.address_country.other")
#   et1_claimant_details_page.main_content.country.set(claimant[:country])
# end

# When("I submit without answering any questions") do
#   et1_claimant_details_page.save_and_continue.click
# end

# Then("I should see mandatory errors on the Claimant's details page") do
#   expect(et1_claimant_details_page.has_correct_validation_error_message?).to be true
# end

# When("leaving an email address field blank") do
#   et1_claimant_details_page.main_content.claimant_contact_preference.set(@claimant[:correspondence])
#   et1_claimant_details_page.save_and_continue.click
# end

# Then("I should see an error message for leaving email address field blank") do
#   expect(et1_claimant_details_page.has_correct_error_message_for_leaving_email_address_field_blank?).to be true
# end

# When("entering an invalid email address") do
#   et1_claimant_details_page.main_content.email_address.set('blah@blah')
#   et1_claimant_details_page.save_and_continue.click
# end

# Then("I should see an error message for entering invalid email address") do
#   expect(et1_claimant_details_page.has_correct_error_message_for_invalid_email_address?).to be true
# end

# When("entering {string} postcode") do |string|
#   et1_claimant_details_page.main_content.post_code.set(string)
#   et1_claimant_details_page.save_and_continue.click
# end

# Then("I should see an error message for invalid UK postcode please use SW55 9QT") do
#   expect(et1_claimant_details_page.has_correct_error_message_for_invalid_uk_postcode?).to be true
# end