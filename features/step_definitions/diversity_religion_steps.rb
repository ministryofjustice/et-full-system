Given(/^a claimant is on the Religion page$/) do
  diversity_pages.claim_type_page.load
  diversity_pages.claim_type_page.save_and_continue
  diversity_pages.sexual_identity_page.save_and_continue
  diversity_pages.relationship_status_page.save_and_continue
  diversity_pages.age_group_caring_responsibilities_page.save_and_continue
end

Then(/^Religion page copy texts are displayed in the correct language$/) do
  expect(diversity_pages.religion_page).to have_correct_translation
end