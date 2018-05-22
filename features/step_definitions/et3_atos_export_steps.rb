Then(/^I can download the ET3 form and validate in TXT format$/) do
  within_admin_window do
    sleep 1
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_response_txt_for, user: @respondent, reference: @my_et3_reference), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et3_response_txt_for, user: @respondent, reference: @my_et3_reference)).to match_text_schema calculated_response_matchers(user: @claimant, representative: @representative[0], respondent: @respondent)
end


Then(/^my entered data is formatted into a PDF file for my ET3 reference number and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_response_pdf_for, user: @respondent, reference: @my_et3_reference), timeout: 30, sleep: 2
  tempfile = atos_interface.download_from_any_zip_to_tempfile(:et3_response_pdf_for, user: @respondent, reference: @my_et3_reference)
  pdf_file = EtFullSystem::Test::FileObjects::Et3PdfFile.new(tempfile)
  expect(pdf_file).to have_correct_contents_for(response: nil,
    respondent: nil,
    representative: nil,
    errors: [],
    indent: 1), -> { errors.join("\n") }
  # @TODO correct contents for what ? ^^
end