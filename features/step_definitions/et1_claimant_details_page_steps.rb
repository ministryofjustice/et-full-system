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

Then("I should be able to select Outside United Kingdom as country of residence") do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data, country: 'Outside United Kingdom')
  data = @claimants[0]
  et1_claimant_details_page.main_content.country.set(data[:country])
end

When("I submit without answering any questions") do
  et1_claimant_details_page.save_and_continue.click
end

Then("I should see mandatory errors on the Claimant's details page") do
  expect(et1_claimant_details_page.has_correct_validation_error_message?).to be true
end

When("leaving an email address field blank") do
  data = @claimants[0]
  et1_claimant_details_page.main_content.claimant_contact_preference.set(data[:correspondence])
  et1_claimant_details_page.save_and_continue.click
end

Then("I should see an error message for leaving email address field blank") do
  expect(et1_claimant_details_page.has_correct_translation_for_leaving_email_address_field_blank?).to be true
end

When("entering an invalid email address") do
  et1_claimant_details_page.main_content.claimant_email_address.email_address.set('blah@blah')
  et1_claimant_details_page.save_and_continue.click
end

Then("I should see an error message for entering invalid email address") do
end