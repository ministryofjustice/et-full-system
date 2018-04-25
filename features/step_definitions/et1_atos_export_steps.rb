Then(/^my entered data is formatted into a PDF format file and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_pdf_for, user: user), timeout: 30, sleep: 2
end
Then(/^my entered data is formatted into an XML format file and is available for ATOS to download$/) do
  within_admin_window do
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_xml_for, user: user), timeout: 30, sleep: 2
end
