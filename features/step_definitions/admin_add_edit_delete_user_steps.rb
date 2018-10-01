Then(/^load User page$/) do
  admin_pages.any_page.menu.click_users
end

When("a new user is created with {string} role") do |string|
  
end

Then("they should be able to login") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("have basic access to ET admin system") do
  pending # Write code here that turns the phrase above into concrete actions
end