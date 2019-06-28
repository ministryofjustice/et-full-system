Then /^the claim should be present in CCD$/ do
  # atos_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  # claim = atos_api.find_claim(claim_application_reference: @claim_application_reference)
  # reference = claim['reference']
  ccd_api = EtFullSystem::Test::CcdApi.new
  ccd_api.login
end