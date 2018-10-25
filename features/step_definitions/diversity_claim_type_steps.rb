Given(/^a claimant is on the Claim Type page$/) do
  diversity_pages.claim_type_page.load
end

Then(/^Claim Type page copy texts are displayed in the correct language$/) do
  expect(diversity_pages.claim_type_page).to have_correct_translation
end