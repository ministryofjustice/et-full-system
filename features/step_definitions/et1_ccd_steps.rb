Given("a DUMMY USER making a claim") do
  @claimant = FactoryBot.create_list(:claimant, 1, :dummy_data, )
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a DUMMY USER submitting an ET1 form by uploading CSV and RTF documents") do
  @claimant = FactoryBot.create_list(:claimant, 1, :dummy_data, :group_claims)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :upload_your_claim_statement)
end

Given("a Male employee making a claim") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, title: :"simple_form.options.claimant.title.mr", gender: :"simple_form.options.claimant.gender.male")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a married woman employee making a claim") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, title: :"simple_form.options.claimant.title.mrs", gender: :"simple_form.options.claimant.gender.female")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'G1 2FF', expected_office: :glasgow)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a female employee making a claim") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, title: :"simple_form.options.claimant.title.miss", gender: :"simple_form.options.claimant.gender.female")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a claimant who does not require assistance at the tribunal hearing submitted an ET1 online") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, has_special_needs: :"simple_form.no")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'G1 2FF', expected_office: :glasgow)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a claimant submitting mandatory Claimant's Details fields") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, telephone_number: '', alternative_telephone_number: '', email_address: '', correspondence: :"simple_form.options.claimant.contact_preference.post")
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("an employee submitting mandatory respresentative fields") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information, organisation_name: '', telephone_number: '', alternative_telephone_number: '', email_address: '', dx_number: '')
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("an employee making a claim where the respondent provided the same address") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:no_work_address, 1, :yes_acas, post_code: 'G1 2FF', expected_office: :glasgow)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("an employee making a claim where the additional respondents provided an acas number") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'M1 1AQ', expected_office: :manchester)
  @respondent.concat FactoryBot.create_list(:respondent,  1 - 1, :conciliation_acas_number, :secondary)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("an employee making a claim where the additional respondents gave reason for not having an acas number") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'G1 2FF', expected_office: :glasgow)
  @respondent.concat FactoryBot.create_list(:respondent,  1 - 1, :conciliation_acas_number, :secondary)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end
Given("a claimant submitting mandatory respondent's Details fields") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, telephone_number: '', work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Given("a claimant submitting data to trigger a 422 error using fake ccd") do
  @claimant = FactoryBot.create_list(:claimant, 1, :fake_ccd_error_422_claimant)
  @representative = []
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, telephone_number: '', work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = nil
  @claim = FactoryBot.create(:claim, :simple)
end

Given("a claimant submitting data to trigger a 422 error in a secondary claimant using fake ccd") do
  @claimant = FactoryBot.create_list(:claimant, 3, :person_data)
  @claimant[1] = FactoryBot.create(:claimant, :fake_ccd_error_422_claimant)
  @representative = []
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, telephone_number: '', work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = nil
  @claim = FactoryBot.create(:claim, :simple)
end

Given("an multiple claimants making a claim by uploading a Rich Text Format document") do
  @claimant = FactoryBot.create_list(:claimant, 3, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'G1 2FF', expected_office: :glasgow)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :upload_your_claim_statement)
end

Given("an employee submitting an ET1 form by uploading CSV and RTF documents") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data, :group_claims)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :upload_your_claim_statement)
end

Then /^the claim should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  office = @respondent[0]["expected_office"]
  ccd_office_lookup = ::EtFullSystem::Test::CcdOfficeLookUp
  ccd_object = EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_by_reference(reference_number, ccd_office_lookup.office_lookup[office][:single][:case_type_id])

  ccd_object.assert_primary_reference(reference_number)
  ccd_object.assert_primary_claimants(@claimant)
  ccd_object.assert_primary_representative(@representative)
  ccd_object.assert_primary_employment(@employment, @claimant)
  ccd_object.assert_claimant_work_address(@respondent.first)
  ccd_object.assert_respondents(@respondent)

  expect(ccd_object.find_pdf_file).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)  
end

Then /^the claim should be present in CCD with an attached acas certificate$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  office = @respondent[0]["expected_office"]
  ccd_office_lookup = ::EtFullSystem::Test::CcdOfficeLookUp
  ccd_object = EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_by_reference(reference_number, ccd_office_lookup.office_lookup[office][:single][:case_type_id])

  ccd_object.assert_primary_reference(reference_number)
  ccd_object.assert_primary_claimants(@claimant)
  ccd_object.assert_primary_representative(@representative)
  ccd_object.assert_primary_employment(@employment, @claimant)
  ccd_object.assert_claimant_work_address(@respondent.first)
  ccd_object.assert_respondents(@respondent)
  ccd_object.assert_acas_pdf_file
  expect(ccd_object.find_pdf_file).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end

Then /^the claim should be present in CCD with no attached acas certificate$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  office = @respondent[0]["expected_office"]
  ccd_office_lookup = ::EtFullSystem::Test::CcdOfficeLookUp
  ccd_object = EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_by_reference(reference_number, ccd_office_lookup.office_lookup[office][:single][:case_type_id])

  ccd_object.assert_primary_reference(reference_number)
  ccd_object.assert_primary_claimants(@claimant)
  ccd_object.assert_primary_representative(@representative)
  ccd_object.assert_primary_employment(@employment, @claimant)
  ccd_object.assert_claimant_work_address(@respondent.first)
  ccd_object.assert_respondents(@respondent)
  ccd_object.assert_no_acas_pdf_file
  expect(ccd_object.find_pdf_file).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end

Then /^the RTF file should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  office = @respondent[0]["expected_office"]
  ccd_office_lookup = ::EtFullSystem::Test::CcdOfficeLookUp
  ccd_object = EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_by_reference(reference_number, ccd_office_lookup.office_lookup[office][:single][:case_type_id])
  
  ccd_object.assert_primary_reference(reference_number)
  ccd_object.assert_primary_claimants(@claimant)
  ccd_object.assert_primary_representative(@representative)
  ccd_object.assert_primary_employment(@employment, @claimant)
  ccd_object.assert_claimant_work_address(@respondent.first)
  ccd_object.assert_respondents(@respondent)

  expect(ccd_object.find_pdf_file).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
  expect(File.size(ccd_object.find_rtf_file)).to eq File.size(File.expand_path(File.join('test_common', 'fixtures', @claim['rtf_file'])))
end

Then /^the multiple claimaints should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  claim = admin_api.exported_to_ccd_claim(reference: reference_number)
  office = @respondent[0]["expected_office"]
  ccd_office_lookup = ::EtFullSystem::Test::CcdOfficeLookUp

  multiple_reference = claim.dig('last_ccd_export', 'external_data', 'case_reference')
  ccd_object = EtFullSystem::Test::Ccd::Et1CcdMultipleClaimants.find_multiples_by_reference(multiple_reference, ccd_office_lookup.office_lookup[office][:multiple][:case_type_id])
  raise "multiple not found for reference #{reference_number} looking for multiple reference #{multiple_reference} at #{Time.now.strftime('%d/%m/%y %H:%M:%S')}" if ccd_object.nil?
  ccd_object.assert_multiple_title(@respondent.first.name)

  ccd_object.assert_claimants_pending_status(ccd_office_lookup.office_lookup[office][:single][:case_type_id])
  ccd_object.assert_primary_claimant(@claimant, @representative, @employment, @respondent, reference_number, ccd_office_lookup.office_lookup[office][:single][:case_type_id])

  if @claimant[0].dig(:group_claims_csv)
    ccd_object.assert_secondary_xls_claimants(@claimant, @representative, @employment, @respondent, ccd_office_lookup.office_lookup[office][:single][:case_type_id])
    expect(ccd_object.find_csv_file(ccd_office_lookup.office_lookup[office][:single][:case_type_id])).to be_present
  else
    ccd_object.assert_secondary_claimant(@claimant, @representative, @employment, @respondent, ccd_office_lookup.office_lookup[office][:single][:case_type_id])
  end

  if @claim['rtf_file']
    expect(File.size(ccd_object.find_rtf_file(ccd_office_lookup.office_lookup[office][:single][:case_type_id]))).to eq File.size(File.expand_path(File.join('test_common', 'fixtures', @claim['rtf_file'])))
  end

  expect(ccd_object.find_pdf_file(ccd_office_lookup.office_lookup[office][:single][:case_type_id])).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end

Given("{string} employees making a claim with multiple respondents") do |string|
  @claimant = FactoryBot.create_list(:claimant, string.to_i, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)

  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: 'G1 2FF', expected_office: :glasgow)
  @respondent.concat FactoryBot.create_list(:respondent,  string.to_i - 1, :conciliation_acas_number, :secondary)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end


Given(/^a claimant submitted an ET1 with a work post code of "([^"]*)"$/) do |post_code|
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, work_post_code: post_code, expected_office: :default)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
end

Then(/^the claim should be present in the "([^"]*)" office CCD system$/) do |office|
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)
  ccd_office_lookup = ::EtFullSystem::Test::CcdOfficeLookUp
  ccd_object = EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_by_reference(reference_number, ccd_office_lookup.office_lookup[office][:single][:case_type_id])

  ccd_object.assert_primary_reference(reference_number)
  ccd_object.assert_primary_claimants(@claimant)
  ccd_object.assert_primary_representative(@representative)
  ccd_object.assert_primary_employment(@employment, @claimant)
  ccd_object.assert_claimant_work_address(@respondent.first)
  ccd_object.assert_respondents(@respondent)

  expect(ccd_object.find_pdf_file).to match_et1_pdf_for(claim: @claim, claimants: @claimant, representative: @representative.first, respondents: @respondent, employment: @employment)
end

Given(/^a claimant submitting data to trigger a 502 error once only in a secondary claimant using fake ccd$/) do
  @claimant = FactoryBot.create_list(:claimant, 3, :person_data)
  @claimant[1] = FactoryBot.create(:claimant, :fake_ccd_error_502_once_claimant)
  @representative = []
  @respondent = FactoryBot.create_list(:respondent,  1, :conciliation_acas_number, telephone_number: '', work_post_code: 'M1 1AQ', expected_office: :manchester)
  @employment = nil
  @claim = FactoryBot.create(:claim, :simple)
end
