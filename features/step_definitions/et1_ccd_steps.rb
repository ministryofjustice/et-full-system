Then /^the claim should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  ccd_data = ccd.caseworker_search_latest_by_reference(reference_number, case_type_id: 'EmpTrib_MVP_1.0_Manc')
  expect(ccd_json.login(reference_number)['case_fields']).to include "feeGroupReference" => reference_number

  match_et1_data_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)

  # expect(zip_file.download_file(:et1_claim_pdf_for, user: @claimant[0])).to match_et1_data_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end