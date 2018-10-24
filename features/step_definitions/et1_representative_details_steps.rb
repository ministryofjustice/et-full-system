Given("a claimant is on Representative's details page") do
  @claimants = FactoryBot.create_list(:claimant, 1, :person_data)
  @representatives = FactoryBot.create_list(:representative, 1, :et3_information)
  start_a_new_et1_claim
  et1_answer_login
  et1_answer_claimant_questions
  et1_answer_group_claimants_questions

  # et1_answer_representatives_questions
  # et1_representatives_details_page.set_for(@representative)
  # et1_representatives_details_page.save_and_continue
end

Then("I can verify that the copy text on Representative's details page displayed correctly") do
  et1_representatives_details_page.main_content.representative.yes.click
  expect(et1_representatives_details_page.has_correct_translation?).to be true
end

# Given("a claimant is on Group claims page") do
  
# end

# Then("Group claims page copy texts are displayed in the correct language") do
#   expect(et1_group_claimants_page.has_correct_translation_on_group_claims?).to be true
# end

# When("I submit no other people are making claims") do
#   et1_group_claimants_page.set(@claimant)
#   et1_group_claimants_page.save_and_continue
# end

# Then("I should be on the Respresentative's details page") do
#   expect(et1_representatives_details_page.main_header).to have_page_header
# end

# When("there 5 or few claimants") do
#   et1_group_claimants_page.main_content.additional_claimants_of_collection_type.yes.click
# end

# Then("I can very that the copy texts correctly dispayed for group claimants") do
#   expect(et1_group_claimants_page.has_correct_translation_for_group_claimants?).to be true
# end

# Given("two employees making a claim") do
#   @claimants = FactoryBot.create_list(:claimant, 2, :person_data)
# end

# Then("I should be able to submit two claimant details") do
#   et1_group_claimants_page.set(@claimants)
#   et1_group_claimants_page.save_and_continue
#   expect(et1_representatives_details_page.main_header).to have_page_header
# end

# When("there are group claimants") do
#   @claimants = FactoryBot.create_list(:claimant, 1, :group_claims)
#   et1_group_claimants_page.set(@claimants)
#   et1_group_claimants_upload_page.main_content.form_group.yes.click
# end

# Then("I can very that the copy texts correctly dispayed for Upload user details in separate spreadsheet") do
#   expect(et1_group_claimants_upload_page.has_correct_translation_for_group_claimants?).to be true
# end

# When("I submit no to uploaded group claimant") do
#   @claimants = FactoryBot.create_list(:claimant, 1, :group_claims)
#   et1_group_claimants_page.set(@claimants)
#   et1_group_claimants_upload_page.save_and_continue
#   expect(et1_representatives_details_page.main_header).to have_page_header
# end

# When("I changed my mind to manually enter claimant details") do
#   @claimants = FactoryBot.create_list(:claimant, 1, :group_claims)
#   et1_group_claimants_page.set(@claimants)
#   et1_group_claimants_upload_page.main_content.form_group.manually_link.click
#   @claimants = FactoryBot.create_list(:claimant, 2, :person_data)
# end

# Then("I submit a group claims via csv file") do
#   @claimants = FactoryBot.create_list(:claimant, 1, :group_claims)
#   et1_answer_group_claimants_questions
# end

# When("I submit without answering any claimant details") do
#   et1_group_claimants_page.main_content.additional_claimants_of_collection_type.yes.click
#   et1_group_claimants_page.save_and_continue
# end

# Then("I should see mandatory errors on the Group claims page") do
#   expect(et1_group_claimants_page.has_correct_mandatory_error_msg_for_group_claimants?).to be true
# end

# When("I submit an invalid date of birth") do
#   et1_group_claimants_page.main_content.additional_claimants_of_collection_type.yes.click
#   et1_group_claimants_page.main_content.about_claimant_2.date_of_birth.set('0/0/0')
#   et1_group_claimants_page.save_and_continue
# end

# Then("I should see an invalid error message for date of birth") do
#   expect(et1_group_claimants_page.has_correct_invalid_error_msg_for_dob?).to be true
# end