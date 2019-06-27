Then /^the claim should be present in CCD$/ do
    api = EtFullSystem::Test::CcdApi.new
    response = api.login
end