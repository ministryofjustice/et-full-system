Given(/^I am "([^"]*)"$/) do |user|
  given_i_am(user.to_sym)
end

Given(/^I am "([^"]*)" with a unique first name$/) do |user|
  given_i_am(user.to_sym, unique: true)
end

And(/^I am the Claimant$/) do
  # Not sure if we need to do anything here yet - we will keep it for syntactical sugar though
end

And(/^I am the lead claimant of more than (\d+) other claimants that I have listed in a spreadsheet$/) do |_claimants|
  # Not sure if we need to do anything here yet - we will keep it for syntactical sugar though
end
