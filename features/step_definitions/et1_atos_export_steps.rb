Then(/^the completed form in PDF format is available for ATOS to download and validate$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_pdf_for, user: @claimants[0]), timeout: 30, sleep: 2
end

Then(/^the completed form in TXT format is available for ATOS to download and validate$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_txt_for, user: @claimants[0]), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et1_claim_txt_for, user: @claimants[0])).to match_text_schema calculated_claim_matchers(user: @claimants[0], representative: @representative, respondents: @respondents, employment: @employment)
end

Then(/^the completed form in XML format is available for ATOS to download and validate$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_xml_for, user: @claimants[0]), timeout: 30, sleep: 2
end

Then(/^the uploaded CSV data is formatted into a TXT format file and is available for ATOS to download$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1a_claim_txt_for, user: @claimants[0]), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et1a_claim_txt_for, user: @claimants[0])).to match_text_schema calculated_et1a_claim_matchers(user: @claimants[0], respondents: @respondents)
end

Then(/^the uploaded CSV data is formatted and available for ATOS to download$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_csv_for, user: @claimants[0]), timeout: 30, sleep: 2
end

Then(/^the completed form in RTF format is available for ATOS to download and validate$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_rtf_for, user: @claimants[0]), timeout: 30, sleep: 2
end

Then(/^the completed form in TXT format should contained 3 employers details$/) do
  within_admin_window do
    api = EtFullSystem::Test::AdminApi.new
    expect { api.claimants_api }.to eventually include a_hash_including(first_name: @claimants[0].dig(:first_name))
    admin_pages.jobs_page.run_export_claims_cron_job
  end
  expect { atos_interface }.to eventually have_zip_file_containing(:et1_claim_txt_for, user: @claimants[0]), timeout: 30, sleep: 2
  expect(atos_interface.download_from_any_zip(:et1_claim_txt_for, user: @claimants[0])).to match_text_schema calculated_claim_matchers(user: @claimants[0], representative: @representative, respondents: @respondents, employment: @employment)
end
