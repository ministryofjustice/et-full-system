Then(/^I should have full access to ET admin$/) do
  expect(admin_pages.any_page.tab.map {|x| x.text}).to eq(admin_pages.any_page.full_access)
end

Given("a super login") do
  admin_username = ::EtFullSystem::Test::Configuration.super_username
  admin_password = ::EtFullSystem::Test::Configuration.super_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
end

Then("I should have partial access to ET admin") do
  expect(admin_pages.any_page.tab.map {|x| x.text}).to eq(admin_pages.any_page.partial_access)
end

Given("a normal user login") do
  admin_username = ::EtFullSystem::Test::Configuration.basic_username
  admin_password = ::EtFullSystem::Test::Configuration.basic_password
  admin_pages.logout_page.load
  admin_pages.dashboard_page.load
  if admin_pages.login_page.displayed?
    admin_pages.login_page.login(email: admin_username, password: admin_password)
    raise "Could not login to admin with username '#{admin_username}' and password '#{admin_password}'" unless admin_pages.dashboard_page.displayed?
  end
end

Then("I should have basic access to ET admin") do
  expect(admin_pages.any_page.tab.map {|x| x.text}).to eq(admin_pages.any_page.basic_access)
end