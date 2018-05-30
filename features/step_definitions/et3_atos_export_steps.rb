Then(/^I can download the ET3 form and validate in TXT format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.respondents_api }.to eventually include a_hash_including(name: @respondent.dig(:name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_response_txt_for, user: @respondent, reference: @my_et3_reference), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et3_response_txt_for, user: @respondent, reference: @my_et3_reference)).to match_text_schema calculated_response_matchers(user: @claimant, representative: @representative[0], respondent: @respondent)
end


Then(/^I can download the ET3 form and validate in PDF format$/) do
  errors = []
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.respondents_api }.to eventually include a_hash_including(name: @respondent.dig(:name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_response_pdf_for, user: @respondent, reference: @my_et3_reference), timeout: 30, sleep: 2
  tempfile = atos_interface.download_from_any_zip_to_tempfile(:et3_response_pdf_for, user: @respondent, reference: @my_et3_reference)
  pdf_file = EtFullSystem::Test::FileObjects::Et3PdfFile.new(tempfile)
  expect(pdf_file).to have_correct_contents_for(response: @claimant,
    respondent: @respondent,
    representative: @representative[0],
    errors: errors,
    indent: 1), -> { errors.join("\n") }
  # @TODO correct contents for what ? ^^
end