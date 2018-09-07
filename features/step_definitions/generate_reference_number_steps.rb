Given("load Generate Reference page") do
  admin_pages.any_page.menu.click_generate_references
end

When("I enter a postcode {string}") do |string|
  admin_pages.generate_reference_number_page.generate_reference(string)
end

Then("I can retrieve the next Claim sequence number") do
  expect(admin_pages.generate_reference_result_page.main_content.search_result.text).to include("ET1 Postal Fee Group Reference Number:") 
end