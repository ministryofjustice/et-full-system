Then /^the claim should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new
  reference_number =admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  ccd_api = EtFullSystem::Test::CcdApi.new
  ccd_api.login(reference_number)
end