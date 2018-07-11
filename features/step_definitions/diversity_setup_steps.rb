Then(/^I shoud be able to launch diversity questionnaire$/) do
  et1_claim_submitted.diversity_link
  binding.pry
  page.has_selector?(diversity_landing_page.heading)
  expect(diversity_landing_page.main_content.heading).to be_displayed
end