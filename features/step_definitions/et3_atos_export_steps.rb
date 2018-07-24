Then(/^I can download the ET3 form and validate in TXT format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.respondents_api }.to eventually include a_hash_including(name: @respondent[0].dig(:name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_response_txt_for, user: @respondent[0], reference: @my_et3_reference), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et3_response_txt_for, user: @respondent[0], reference: @my_et3_reference)).to match_text_schema calculated_response_matchers(user: @claimant[0], representative: @representative[0], respondent: @respondent[0])
end


Then(/^I can download the ET3 form and validate in PDF format$/) do
  errors = []
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.respondents_api }.to eventually include a_hash_including(name: @respondent[0].dig(:name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_response_pdf_for, user: @respondent[0], reference: @my_et3_reference), timeout: 30, sleep: 2
  tempfile = atos_interface.download_from_any_zip_to_tempfile(:et3_response_pdf_for, user: @respondent[0], reference: @my_et3_reference)
  pdf_file = EtFullSystem::Test::FileObjects::Et3PdfFile.new(tempfile)
  expect(pdf_file).to have_correct_contents_for(response: @claimant[0],
    respondent: @respondent[0],
    representative: @representative[0],
    errors: errors,
    indent: 1), -> { errors.join("\n") }
end

Then("I can download the ET3 form and validate that the filename starts with {string}") do |string|
  errors = []
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.respondents_api }.to eventually include a_hash_including(name: @respondent[0].dig(:name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_filename_start_with, user: @respondent[0], reference: @my_et3_reference, local_postcode: string), timeout: 30, sleep: 2
end

Then("it will be forwarded to the Office address {string}") do |string|
  if URI.parse(current_url).path == et1_claim_submitted.url
    et1_claim_submitted.main_content.local_office_address.text == "Submitted 23 July 2018 to tribunal office Bristol, #{string}"
  else
    form_submission_page.local_office_address.text == string
  end
end

Then("phone number {string}") do |string|
  form_submission_page.local_office_phone.text == string
end

Then(/^I can download the ET3 form and validate in RTF format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.respondents_api }.to eventually include a_hash_including(name: @respondent[0].dig(:name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_response_rtf_for, user: @respondent[0], reference: @my_et3_reference), timeout: 30, sleep: 2
end
