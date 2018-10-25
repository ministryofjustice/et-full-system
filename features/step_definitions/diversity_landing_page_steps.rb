Given("a claimant is on the Landing page") do
  diversity_pages.diversity_landing_page.load
end

Then("Landing page copy texts are displayed in the correct language") do
  expect(diversity_pages.diversity_landing_page).to have_correct_translation
end
