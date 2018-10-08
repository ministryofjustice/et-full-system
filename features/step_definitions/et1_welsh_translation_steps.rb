Given("a claimant is on the Apply page in {string}") do |string|
  et1_new_claim_page.load
  et1_new_claim_page.switch_language
end

Then("Your feedback copy text is in the correct language") do
  expect(et1_new_claim_page.has_correct_translation_feedback_notice?).to be true
end

Then("Main header copy text is in the correct language") do
  expect(et1_new_claim_page.has_correct_translation_headertext?).to be true
end

Then("Are you in time copy text is in the correct language") do
  expect(et1_new_claim_page.has_correct_translation_are_you_in_time?).to be true
end

Then("Have you contacted Acas copy text is in the correct language") do
  expect(et1_new_claim_page.has_correct_translation_have_you_contacted_acas?).to be true
end

Then("What you'll need copy text is in the correct language") do
  expect(et1_new_claim_page.has_correct_translation_feedback_notice?).to be true
end

Then("Start a claim and Return to a claim copy text are in the correct language") do
  expect(et1_new_claim_page.has_correct_translation_action_buttons_labelled?).to be true
end

Then("Guide and Contact us links are showing in the correct language") do
  expect(et1_new_claim_page.has_correct_translation_action_buttons_labelled?).to be true
end