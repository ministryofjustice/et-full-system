Given(/^I am "([^"]*)"$/) do |user|
  given_i_am(user.to_sym)
end

And(/^I am the Claimant$/) do
  # Not sure if we need to do anything here yet - we will keep it for syntactical sugar though
end