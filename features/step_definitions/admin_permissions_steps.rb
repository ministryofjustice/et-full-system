Then("import {string} users") do |string|
  @email = string
  @users = create(:users)
  admin_pages.any_page.menu.click_users
  admin_pages.users_page.click_import_users
  admin_pages.import_file_page.choose_file(@users)
end

Then("users have successfully imported") do
  admin_pages.users_page.search_by_email('Starts with', @email)
  admin_pages.users_page.assert_users_are_imported
end

When("a {string} login") do |string|
  user = admin_pages.users_page.get_username_password(string)
  puts "user: #{user}"
  admin_username = user[0]
  admin_password = user[1]
  @name = user[2]
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?  
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
end

Then(/^I should have full access to ET admin$/) do
  tab_names = admin_pages.any_page.full_access  
  tab_names[tab_names.index('Logout') -1] =  @name
  expect(admin_pages.any_page.names.map {|x| x.text}).to eq(tab_names)

  # Tear down of the uploaded csv
  admin_username = ::EtFullSystem::Test::Configuration.admin_username
  admin_password = ::EtFullSystem::Test::Configuration.admin_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
  admin_pages.any_page.menu.click_users
  admin_pages.users_page.assert_users_are_delete
end

Then("I should have partial access to ET admin") do
  tab_names = admin_pages.any_page.partial_access
  tab_names[tab_names.index('Logout') -1] =  @name
  expect(admin_pages.any_page.names.map {|x| x.text}).to eq(tab_names)

  # Tear down of the uploaded csv
  admin_username = ::EtFullSystem::Test::Configuration.admin_username
  admin_password = ::EtFullSystem::Test::Configuration.admin_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
  admin_pages.any_page.menu.click_users
  admin_pages.users_page.assert_users_are_delete
end

Then("I should have basic access to ET admin") do
  tab_names = admin_pages.any_page.basic_access
  expect(admin_pages.any_page.names.map {|x| x.text}).to eq(tab_names)

  # Tear down of the uploaded csv
  admin_username = ::EtFullSystem::Test::Configuration.admin_username
  admin_password = ::EtFullSystem::Test::Configuration.admin_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
  admin_pages.any_page.menu.click_users
  admin_pages.users_page.assert_users_are_delete
end

