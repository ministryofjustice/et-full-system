Then(/^the response files should be present in the existing ccd claim$/) do
  query = -> { EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_by_ethos_case_reference(@existing_claim.ethos_case_reference, office_lookup[:manchester][:single][:case_type_id]) }
  expect(query).to eventually have_et3_documents(@respondent[0])
end


And(/^the submitted Employment Tribunal response is exported to ccd for me$/) do
  ccd_system = admin_api.external_systems(q: { reference_starts_with: 'ccd_' }).detect do |system|
    system[:office_codes].include?(@my_et3_reference[0..1].to_i)
  end
  responses = admin_api.responses q: {reference_equals: @my_et3_reference}
  response_id = responses.first[:id]
  admin_api.export_response_to_ccd(external_system_id: ccd_system['id'], response_id: response_id)
end