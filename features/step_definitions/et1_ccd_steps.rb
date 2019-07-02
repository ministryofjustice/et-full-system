Then /^the claim should be present in CCD$/ do
  # admin_api = EtFullSystem::Test::AdminApi.new
  # reference_number =admin_api.get_reference_number(claim_application_reference: @claim_application_reference)

  binding.pry
  ccd_data = ccd.caseworker_search_latest_by_reference('332000050800', case_type_id: 'EmpTrib_MVP_1.0_Manc')

  # ccd_json = EtFullSystem::Test::Et1CcdJson.find_case(reference_number: reference_number)
  # et1_online_js = EtFullSystem::Test::Et1CcdJson.new


  expect(ccd_json.login(reference_number)['case_fields']).to include "feeGroupReference" => reference_number
  expect(ccd_api.login(reference_number)['case_fields']).to include 

  
  # @et_online_json = data.assert_valid_claimant(@claimant, @representative, @respondent, @employment, @claim)
  # expect(ccd_json).to include(et_online_json)
end