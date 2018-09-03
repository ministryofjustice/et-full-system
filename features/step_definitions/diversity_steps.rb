Then(/^I should be able to load diversity questionnaire form page$/) do
  et1_claim_submitted.diversity_link
  expect(diversity_pages.diversity_landing_page.main_content.heading).to have_content("Diversity monitoring questionnaire")
end

Given(/^a claimant answered all blank questions on the survey participant form$/) do
  @diversity = build(:diversity, claim_type: '', sex: '', gender: '', gender_at_birth: '', 
    sexual_identity: '', relationship_status:'', age_group: '', responsibilites: '', religion: '', 
    ethnic_group: '', ethnic_type: '', health: '', pregnancy: '')
  diversity_load_page
  answer_diversity_page(@diversity)
end

When(/^the completed Diversity questionnaire form is submitted$/) do
  diversity_submit_form
end

Then(/^I should be on the Thank you page$/) do
  expect(diversity_pages.confirmation_page.main_content.main_header).to have_content("Thank you")
end

When(/^a claimant answered all questions on the survey participant form$/) do
  diversity = build(:diversity)
  diversity_load_page
  answer_diversity_page(diversity)
end

Then("I should see participant survey populated in ET-Admin Diversity Responses page") do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    api.diversity_api.should equal  @diversity.to_h
  end
end