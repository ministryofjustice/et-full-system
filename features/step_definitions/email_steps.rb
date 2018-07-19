Given /^I answered and continued from Saving your claim page$/ do
  @claimants = FactoryBot.create_list(:claimant, 1, :answer_data)

  start_a_new_et1_claim
  et1_answer_login
end

Then(/^I am notified via email that the claim has been started$/) do
  puts "Email Address: #{@claimants[0].email_address}"
  mail = EtFullSystem::Test::MailApi.new

binding.pry
  expect { mail.claim_started_email(@claimants[0].email_address) }.to eventually include(To: @claimants[0].dig(:email_address))
end