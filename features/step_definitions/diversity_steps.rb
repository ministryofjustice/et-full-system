Then(/^I should be able to load diversity questionnaire form page$/) do
  et1_claim_submitted.diversity_link
  expect(diversity_pages.diversity_landing_page.main_content.heading).to have_content("Diversity monitoring questionnaire")
end

Given(/^a claimant answered all blank questions on the survey participant form$/) do
  @diversity = build(:diversity, :blank)
  diversity_load_page
  answer_diversity_page(@diversity)
end

When(/^the completed Diversity questionnaire form is submitted$/) do
  diversity_submit_form
  @submission_timestamp = Time.now.gmtime.strftime("%Y-%m-%dT%H:%I:%M")
end

Then(/^I should be on the Thank you page$/) do
  expect(diversity_pages.confirmation_page.main_content.main_header).to have_content("Thank you")
end

When(/^a claimant answered all questions on the survey participant form$/) do
  @diversity = build(:diversity, :not_blank)
  diversity_load_page
  answer_diversity_page(@diversity)
end

Then("I should see participant survey populated in ET-Admin Diversity Responses page") do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect {api.diversity_api(@submission_timestamp).symbolize_keys}.to eventually include @diversity.to_h
  end
end

Given("a claimant answered Any other religion on the survey participant form") do
  @diversity = build(:diversity, :not_blank, religion: 'Any other religion', religion_please_describe: 'Free text')
  diversity_load_page
  answer_diversity_page(@diversity)
end

Given("a claimant prefered not to answered ethnicity on the survey participant form") do
  @diversity = build(:diversity, :not_blank, ethnicity: 'Prefer not to say', ethnicity_subgroup: nil)
  diversity_load_page
  answer_diversity_page(@diversity)
end

When("user changed {string} to {string}") do |string, string2|
  @diversity = build(:diversity, :not_blank, claim_type: "#{string2}")
  diversity_pages.submission_form_page.main_content.form_fields.claim_type.link.click
  diversity_pages.claim_type_page.set_for(@diversity)
end

Then("the updated data is saved on the system") do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect {api.diversity_api(@submission_timestamp).symbolize_keys}.to eventually include @diversity.to_h
  end
end