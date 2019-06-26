# Then /^the claim should be present in CCD$/ do
#   ccd_client = EtCcdClient::Client.new
#   ccd_client.login
#   api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
#   claim = api.find_claim(claim_application_reference: @claim_application_reference)
#   reference = claim['reference']
#   expect(ccd_client.caseworker_search_latest_by_reference(reference, case_type_id: 'EmpTrib_MVP_1.0_Manc')).to be_present
# end