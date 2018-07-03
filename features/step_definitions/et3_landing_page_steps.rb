Given(/^I am on the ET3 landing page$/) do
  start_page.load
  expect(start_page).to be_displayed
  expect(start_page).to have_header
  expect(start_page).to have_introduction
end

When(/^I click on the begin this form button$/) do
  start_page.next
end

Then(/^I should be taken to the respondents details page$/) do
  expect(respondents_details_page).to be_displayed
end

Then(/^I should see timeout message$/) do
  # TODO functionality needs adding
end

Then(/^I should see guidance information$/) do
  # TODO functionality needs adding
end

