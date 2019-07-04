Then /^the claim should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)

  ccd_data = EtFullSystem::Test::CcdApi.new
  response = ccd_data.caseworker_search_latest_by_reference(reference_number)
  # expect(response).to include ccd_case_details(reference_number)

  expect(response).to include ccd_claimant_details(@claimant).as_json
end