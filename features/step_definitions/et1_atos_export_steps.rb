Then(/^I can download the form and validate in PDF format$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1_claim_pdf_for, user: @claimant[0], ignore_before: @test_start_time)).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end

Then("the claim should be present in ATOS") do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1_claim_pdf_for, user: @claimant[0], ignore_before: @test_start_time)).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end

Then(/^I can download the form and validate in TXT format$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1_claim_txt_for, user: @claimant[0], ignore_before: @test_start_time)).to match_text_schema calculated_claim_matchers(user: @claimant[0], representative: @representative[0], respondents: @respondent, employment: @employment)
end

Then(/^I can download the uploaded CSV data and validate in TXT format$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1a_claim_txt_for, user: @claimant[0], ignore_before: @test_start_time)).to match_text_schema calculated_et1a_claim_matchers(user: @claimant[0], respondents: @respondent)
end

Then(/^I can download the uploaded CSV data and validate in CSV format$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1_claim_csv_for, user: @claimant[0], ignore_before: @test_start_time)).to be_present
end

Then(/^I can download the form and validate in Rich Text format$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1_claim_rtf_for, user: @claimant[0], ignore_before: @test_start_time)).to be_present
end

Then(/^I can download the form and validate the TXT file contained 3 employers details$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1_claim_txt_for, user: @claimant[0], ignore_before: @test_start_time)).to match_text_schema calculated_claim_matchers(user: @claimant[0], representative: @representative[0], respondents: @respondent, employment: @employment)
end

Then("I can download the form and validate that the filename starts with {string}") do |string|
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1_claim_pdf_for, user: @claimant[0], ignore_before: @test_start_time)).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end

Then("I can download the form from the secondary queue and that the filename starts with {string}") do |string|
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_secondary_interface
  zip_file = api.atos_zip_file_for_claim(claim_application_reference: @claim_application_reference, ignore_before: @test_start_time)
  expect(zip_file.download_file(:et1_claim_pdf_for, user: @claimant[0], ignore_before: @test_start_time)).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end
