When("import {string} users") do |string|
  @email = string
  @users = create(:users)
  admin_pages.any_page.menu.click_users
  admin_pages.users_page.click_import_users
  admin_pages.import_file_page.choose_file(@users)
end

Then("users successfully imported") do
  admin_pages.users_page.search_by_email('Starts with', @email, @users)
end

Then("admin user can delete users") do
  admin_pages.any_page.menu.click_users
  @users = create(:users)
  admin_pages.users_page.delete_users(@users)
end

Then(/^I should have full access to ET admin$/) do
  expect(admin_pages.any_page.names.map {|x| x.text}).to eq(admin_pages.any_page.full_access)
end

When("a {string} login") do |string|
  admin_username = string
  admin_password = ::EtFullSystem::Test::Configuration.admin_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: string, password: admin_password)
    raise "Could not login to admin with username '#{string}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
end

Then("I should have partial access to ET admin") do
  expect(admin_pages.any_page.names.map {|x| x.text}).to eq(admin_pages.any_page.partial_access)
end

Then("I should have basic access to ET admin") do
  expect(admin_pages.any_page.names.map {|x| x.text}).to eq(admin_pages.any_page.basic_access)
end

