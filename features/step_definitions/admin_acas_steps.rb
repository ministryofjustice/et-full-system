Given(/^I am an ACAS administrator$/) do
  user = build(:admin_user, :acas_only)
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: user.email, password: user.password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
end


When(/^I enter an ACAS certificate number in the ACAS search field$/) do
  certificate = build(:acas_certificate, :valid)
  admin_pages.any_page.menu.choose_acas_certificates
  admin_pages.acas_search_page.search(certificate.number)
end


Then(/^I can view the contents of the acas document$/) do
  expect(admin_pages.acas_search_results_page).to have_valid_certificate
end
