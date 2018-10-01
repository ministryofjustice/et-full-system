Then(/^load User page$/) do
  admin_pages.any_page.menu.click_users
end

When("a new user is created with {string} role") do |string|
  @user = build(:users, role: string)
  admin_pages.users_page.click_new_user
  admin_pages.new_user_page.add_new_user(@user)
  admin_pages.new_user_page.has_successfully_created?
end

Then("they should be able to login") do
  admin_pages.any_page.utility_nav.click_logout

  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: @user[:username], password: @user[:password])
    raise "Could not login to admin with username '#{@user[:username]}' and password '#{@user[:password]}'" unless admin_pages.dashboard_page.displayed?
  end
end

Then("have basic access to ET admin system") do
  tab_names = admin_pages.any_page.basic_access
  expect(admin_pages.any_page.names.map {|x| x.text}).to eq(tab_names)

  # Tear down
  admin_username = ::EtFullSystem::Test::Configuration.admin_username
  admin_password = ::EtFullSystem::Test::Configuration.admin_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
  admin_pages.any_page.menu.click_users
  #Need to search user thats just been and remove them from admin
  # admin_pages.users_page.assert_users_are_delete
end