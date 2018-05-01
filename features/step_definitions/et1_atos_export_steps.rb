Then(/^my entered data is formatted into a PDF format file and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_pdf_for, user: user), timeout: 30, sleep: 2
end
Then(/^my entered data is formatted into a TXT format file and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_txt_for, user: user), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et1_claim_txt_for, user: user)).to match_text_schema calculated_claim_matchers(user: user)
end

Then(/^my entered data is formatted into an XML format file and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_xml_for, user: user), timeout: 30, sleep: 2
end


Then(/^my uploaded ET1 CSV data is formatted into a TXT format file and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1a_claim_txt_for, user: user), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et1a_claim_txt_for, user: user)).to match_text_schema calculated_et1a_claim_matchers(user: user)
end


Then(/^the CSV file is stored in a landing folder$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_csv_for, user: user), timeout: 30, sleep: 2
end

Then(/^the RTF file is stored in a landing folder$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_rtf_for, user: user), timeout: 30, sleep: 2
end
