Given("an administrator login") do
  admin_username = ::EtFullSystem::Test::Configuration.admin_username
  admin_password = ::EtFullSystem::Test::Configuration.admin_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
end

When("a new postcode {string} is added to the {string} local office address") do |string, string2|
  admin_pages.any_page.menu.click_office_postcodes
  admin_pages.office_postcodes_page.add_new_office_postcode(string, string2)
end

Then("the new postcode is saved on the system") do
  admin_pages.office_postcodes_page.has_success_error_msg?
end