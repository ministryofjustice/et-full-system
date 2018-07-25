Given /^a claimant continued from Saving your claim page$/ do
  @claimants = FactoryBot.create_list(:claimant, 1, :answer_data)

  start_a_new_et1_claim
  et1_answer_login
end

Then(/^an email is sent to notify user that a claim has been started$/) do
  puts "Email Address: #{@claimants[0].email_address}"
  mail = EtFullSystem::Test::MailApi.new
  expect { mail.claim_started_email(@claimants[0].email_address)['To'] }.to eventually include(@claimants[0].dig(:email_address))
end

Given /^a claimant completed an ET1 form$/ do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :employer)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)


  start_a_new_et1_claim
  et1_answer_login
  et1_answer_claimant_questions
  et1_answer_group_claimants_questions
  et1_answer_representatives_questions
  et1_answer_respondents_questions
  et1_answer_employment_details_questions
  et1_answer_claim_type_questions
  et1_answer_claim_details_questions
  et1_answer_claim_outcome_questions
  et1_answer_more_about_the_claim_questions
  et1_submit_claim
end

Then(/^an email is sent to notify user that a claim has been successfully submitted$/) do
  puts "Email Address: #{@claimants[0].email_address}"
  mail = EtFullSystem::Test::MailApi.new
  expect { mail.claim_submitted_email(@claimants[0].email_address)['To'] }.to eventually include(@claimants[0].dig(:email_address))
end