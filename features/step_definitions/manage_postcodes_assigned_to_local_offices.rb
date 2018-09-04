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

When("a new postcode {string} is added to {string} office") do |string, string2|
  admin_pages.any_page.menu.click_office_postcodes
  admin_pages.office_postcodes_page.add_new_office_postcode(string, string2)
end

Then("the new postcode is saved on the system") do
  admin_pages.office_postcodes_page.has_successfully_created_error_msg?
end

Given("a postcode {string} is assigned to {string} office") do |string, string2|
  admin_pages.any_page.menu.click_office_postcodes
  admin_pages.office_postcodes_page.add_new_office_postcode(string, string2)
end

When("I reassign the postcode to {string} office") do |string|
  admin_pages.any_page.menu.click_office_postcodes
  admin_pages.office_postcodes_page.edit_postcode
  admin_pages.new_office_postcodes_page.edit_office_address(string)
end

Then("the postcode will be assigned to the different office and no longer assigned to the original office") do
  admin_pages.office_postcodes_page.has_successfully_edited_error_msg?
end

Given("an existing postcode {string} is assigned to {string} office") do |string, string2|
  admin_pages.any_page.menu.click_office_postcodes
  admin_pages.office_postcodes_page.add_new_office_postcode(string, string2)
end

When("I delete postcode {string}") do |string|
  admin_pages.any_page.menu.click_office_postcodes
  admin_pages.office_postcodes_page.delete_postcode
end

Then("the deleted postcode is no longer saved in the system") do
  admin_pages.office_postcodes_page.has_successfully_delete_error_msg?
end