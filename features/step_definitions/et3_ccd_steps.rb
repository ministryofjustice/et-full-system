Then(/^the response files should be present in the existing ccd claim$/) do
  query = -> { EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_by_ethos_case_reference(@existing_claim.ethos_case_reference, office_lookup[:manchester][:single][:case_type_id]) }
  expect(query).to eventually have_et3_documents(@respondent[0])
end
