Given("a Male employee making a claim") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, title: :"simple_form.options.claimant.title.mr", gender: :"simple_form.options.claimant.gender.male")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a married woman employee making a claim") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, title: :"simple_form.options.claimant.title.mrs", gender: :"simple_form.options.claimant.gender.female")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a woman employee making a claim") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, title: :"simple_form.options.claimant.title.miss", gender: :"simple_form.options.claimant.gender.female")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a claimant who does not require assistance at the tribunal hearing submitted an ET1 online") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, has_special_needs: :"simple_form.no")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a claimant submitting mandatory Claimant's Details fields") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, telephone_number: '', alternative_telephone_number: '', email_address: '', correspondence: :"simple_form.options.claimant.contact_preference.post")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("an employee submitting mandatory respresentative fields") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information, organisation_name: '', telephone_number: '', alternative_telephone_number: '', email_address: '', dx_number: '')
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Then /^the claim should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)

  sleep 5
  ccd_data = ccd.caseworker_search_latest_by_reference(reference_number, case_type_id: 'EmpTrib_MVP_1.0_Manc')

  expect(ccd_data['case_fields']).to include ccd_case_details(reference_number)
  expect(ccd_data['case_fields']).to include "claimantOtherType" => a_hash_including(claimant_other_type(@employment).as_json)
  expect(ccd_data['case_fields']).to include "claimantType" => a_hash_including(claimant_type(@claimant[0]).as_json)
  expect(ccd_data['case_fields']).to include "claimantIndType" => a_hash_including(claimant_ind_type(@claimant[0]).as_json)
  
  if @representative[0]['representative_have'] == 'No'
    expect(ccd_data['case_fields']).to include representative_claimant_type(@representative[0])
  else
    expect(ccd_data['case_fields']).to include "representativeClaimantType" => a_hash_including(representative_claimant_type(@representative[0]).as_json)
  end
  expect(ccd_data['case_fields']).to include "claimantWorkAddress" => a_hash_including(claimant_work_address(@respondent[0]).as_json)
  expect(ccd_data['case_fields']).to include "respondentSumType" => a_hash_including(respondent_sum_type(@respondent[0]).as_json)
end

