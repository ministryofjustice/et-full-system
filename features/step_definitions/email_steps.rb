Given /^I answered and continued from Saving your claim page$/ do
  @claimants = FactoryBot.create_list(:claimant, 1, :answer_data)
  binding.pry

  start_a_new_et1_claim
  et1_answer_login
end

Then(/^I am notified via email that the claim has been started$/) do
  
end