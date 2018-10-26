Given(/^a claimant is on the Sexual Identity page$/) do
  diversity_pages.claim_type_page.load
  diversity_pages.claim_type_page.save_and_continue
end

Then(/^Sexual Identity page copy texts are displayed in the correct language$/) do
  expect(diversity_pages.sexual_identity_page).to have_correct_translation
end