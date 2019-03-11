When(/^I load the Terms and conditions page from the ET3 landing page$/) do
  load_et3_start_page
  start_page.footer.terms.click
end

Then(/^I should be taken to Terms and Conditions page$/) do
  expect(terms_and_conditions_page.main_header).to have_header
end