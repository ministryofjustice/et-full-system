Then(/^I shoud be able to load diversity questionnaire$/) do
  et1_claim_submitted.diversity_link
  expect(diversity_landing_page.main_content.heading).to have_content("Diversity monitoring questionnaire")
end