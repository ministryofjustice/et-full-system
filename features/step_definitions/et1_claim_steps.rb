When /^the completed form is submitted$/ do
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
  log_event :et1_claim_created, @claimants

end

When /^I submit a completed ET1 form$/ do
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
  log_event :et1_claim_created, @claimantse
end

Then("the address lookup will be based on respondent's work address and will forwarded to {string}") do |string|
  expect(et1_claim_submitted.main_content.content_section.confirmation_table.tbody.local_office_address.text).to end_with(string)
end

Then("submission details page includes RTF and CSV files") do
    expect(et1_claim_submitted.main_content.content_section.confirmation_table.tbody.attachments.text).to end_with("#{@claim[:rtf_file]} #{@claimants[0][:group_claims_csv]}")
end

Then("the address lookup will be based on claimant's work address and will be forwarded to {string}") do |string|
  expect(et1_claim_submitted.main_content.content_section.confirmation_table.tbody.local_office_address.text).to end_with(string)
end