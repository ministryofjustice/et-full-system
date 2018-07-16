Then("I should be able to load diversity questionnaire") do
  et1_claim_submitted.diversity_link
  expect(diversity_pages.diversity_landing_page.main_content.heading).to have_content("Diversity monitoring questionnaire")
end

When(/^a Claimant submitted an empty Diversity questionnaire form$/) do
  diversity_load_page
  diversity_answer_claim_type_page
  diversity_answer_sexual_identity_page
  diveristy_answer_relationship_status_page
  diveristy_answer_age_group_caring_responsibilties
  diversity_answer_religion_page
  diversity_answer_ethnic_group_page
  diversity_answer_health_page
  diversity_answer_pregnancy_page
  diversity_submit_form_page
end

Then(/^I should on Diversity confirmation page$/) do
  expect(diversity_pages.confirmation_page.main_content.main_header).to have_content("Thank you")
end