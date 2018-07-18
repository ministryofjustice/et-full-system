Given(/^I am an ACAS administrator$/) do
  admin_username = ::EtFullSystem::Test::Configuration.admin_username
  admin_password = ::EtFullSystem::Test::Configuration.admin_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
end


When(/^I enter an ACAS certificate number in the ACAS search field$/) do
  if ENV['ENVIRONMENT'] == 'local'
    @certificate = build(:acas_mock_certificate, :mock_valid)
  else
    @certificate = build(:acas_certificate, :valid)
  end
  admin_pages.any_page.menu.choose_acas_certificates
  admin_pages.acas_search_page.search(@certificate.number)
end

When(/^I enter an invalid format ACAS certificate number$/) do
  if ENV['ENVIRONMENT'] == 'local'
    @certificate = build(:acas_mock_certificate, :mock_invalid)
  else
    @certificate = build(:acas_certificate, :invalid)
  end
  
  admin_pages.any_page.menu.choose_acas_certificates
  admin_pages.acas_search_page.search(@certificate.number)
end

When(/^I enter a not found ACAS certificate number$/) do
  @certificate = build(:acas_mock_certificate, :mock_not_found)
  admin_pages.any_page.menu.choose_acas_certificates
  admin_pages.acas_search_page.search(@certificate.number)
end

When(/^I enter a 'server error' ACAS certificate number$/) do
  @certificate = build_list(:acas_mock_certificate, :mock_server_error)
  admin_pages.any_page.menu.choose_acas_certificates
  admin_pages.acas_search_page.search(@certificate.number)
end

Then(/^I can view the contents of the acas document$/) do
  expect(admin_pages.acas_search_results_page).to have_valid_certificate_for(@certificate)
end


Then(/^the system should return feedback from acas 'No certificate returned from ACAS for R000201\/18\/68'$/) do
  expect(admin_pages.acas_search_results_page).to have_not_found_certificate_message_for(@certificate)
end


Then(/^the system should return feedback from acas 'Please enter a valid certificate number'$/) do
  expect(admin_pages.acas_search_results_page).to have_invalid_certificate_message_for(@certificate)
end


Then(/^the system should return feedback from acas 'There was a problem with the ACAS service \-  please try again later'$/) do
  expect(admin_pages.acas_search_results_page).to have_server_error_message_for(@certificate)
end


Then(/^I can download the contents of the acas document$/) do
  expect(admin_pages.acas_search_results_page).to have_download_link_for(@certificate)
end
