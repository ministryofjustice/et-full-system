Given("a claimant is on the Return to your claim page") do
  load_start_page
  et1_new_claim_page.return_to_claim
end

Then("Return to your claim copy texts are displayed in the correct language") do
  expect(et1_return_to_your_claim_page.has_correct_translation?).to be true
end