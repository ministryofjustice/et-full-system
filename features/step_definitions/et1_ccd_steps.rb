Then /^the claim should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  sleep 10
  ccd_data = ccd.caseworker_search_latest_by_reference(reference_number, case_type_id: 'EmpTrib_MVP_1.0_Manc')

  # ccd_data = EtFullSystem::Test::CcdApi.new
  # response = ccd_data.caseworker_search_latest_by_reference(reference_number)
  expect(ccd_data['case_fields']).to include ccd_case_details(reference_number)
  expect(ccd_data['case_fields']).to include claimant_type(@claimant).as_json
  expect(ccd_data['case_fields']).to include claimant_ind_type(@claimant).as_json
end
