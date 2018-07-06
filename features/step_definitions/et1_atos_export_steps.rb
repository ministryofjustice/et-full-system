Then(/^I can download the form and validate in PDF format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_pdf_for, user: @claimants[0]), timeout: 30, sleep: 2
end

Then(/^I can download the form and validate in TXT format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_txt_for, user: @claimants[0]), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et1_claim_txt_for, user: @claimants[0])).to match_text_schema calculated_claim_matchers(user: @claimants[0], representative: @representatives[0], respondents: @respondents, employment: @employment)
end

Then(/^I can download the form and validate in XML format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_xml_for, user: @claimants[0]), timeout: 30, sleep: 2
end

Then(/^I can download the uploaded CSV data and validate in TXT format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1a_claim_txt_for, user: @claimants[0]), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et1a_claim_txt_for, user: @claimants[0])).to match_text_schema calculated_et1a_claim_matchers(user: @claimants[0], respondents: @respondents)
end

Then(/^I can download the uploaded CSV data and validate in CSV format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_csv_for, user: @claimants[0]), timeout: 30, sleep: 2
end

Then(/^I can download the form and validate in Rich Text format$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_rtf_for, user: @claimants[0]), timeout: 30, sleep: 2
end

Then(/^I can download the form and validate the TXT file contained 3 employers details$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_txt_for, user: @claimants[0]), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et1_claim_txt_for, user: @claimants[0])).to match_text_schema calculated_claim_matchers(user: @claimants[0], representative: @representatives[0], respondents: @respondents, employment: @employment)
end

Then(/^I can download the form and validate that the filname start with 14$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_filename_start_with, user: @claimants[0]), timeout: 30, sleep: 2
end