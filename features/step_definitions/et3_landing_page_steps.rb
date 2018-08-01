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

Then(/^I should see other relevant links$/) do
    expect(start_page.sidebar.claim_link['href']).to eq 'https://www.gov.uk/employment-tribunals'
    expect(start_page.sidebar.response_link['href']).to eq 'https://www.gov.uk/being-taken-to-employment-tribunal-by-employee'
    expect(start_page.sidebar.contact_link['href']).to eq 'https://www.gov.uk/guidance/employment-tribunal-offices-and-venues'
    expect(start_page.sidebar.download_link['href']).to eq 'https://www.employmenttribunals.service.gov.uk/form/pdf/141ET3_0414v2.pdf'
    expect(start_page.sidebar.more_category_link['href']).to eq 'http://gov.uk/browse/working'
  end