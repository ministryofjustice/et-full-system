Then(/^my entered data is formatted into a TXT format for my ET3 reference number and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et3_response_txt_for, user: et3_helper.user, reference: @my_et3_reference), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et3_response_txt_for, user: et3_helper.user, reference: @my_et3_reference)).to match_text_schema calculated_response_matchers(user: et3_helper.user)
end
