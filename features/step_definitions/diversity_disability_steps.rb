Given(/^a claimant is on the Disability page$/) do
  diversity_pages.claim_type_page.load
  diversity_pages.claim_type_page.save_and_continue
  diversity_pages.sexual_identity_page.save_and_continue
  diversity_pages.relationship_status_page.save_and_continue
  diversity_pages.age_group_caring_responsibilities_page.save_and_continue
  diversity_pages.religion_page.save_and_continue
  diversity_pages.ethnic_group_page.save_and_continue
  diversity_pages.health_page.save_and_continue
end

Then(/^Disability page copy texts are displayed in the correct language$/) do
  expect(diversity_pages.pregnancy_page).to have_correct_translation
end