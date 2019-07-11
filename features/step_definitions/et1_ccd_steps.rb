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

Given("an employee making a claim where the respondent provided the same address") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:no_work_address, 1, :yes_acas)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)  
end

Given("an employee making a claim where the additional respondents provided an acas number") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:conciliation_acas_number, 2)
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim) 
end

Given("an employee making a claim where the additional respondents gave reason for not having an acas number") do
  @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
  @representative = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondent = FactoryBot.create_list(:acas_number_reason, 1, :no_acas, no_acas_number_reason: :"simple_form.options.respondent.no_acas_number_reason.acas_has_no_jurisdiction")
  @employment = FactoryBot.create(:employment, :still_employed)
  @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim) 
end

Then /^the claim should be present in CCD$/ do
  admin_api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  reference_number = admin_api.get_reference_number(claim_application_reference: @claim_application_reference)

  ccd_object = EtFullSystem::Test::Ccd::Et1CcdJsonObject.find_by_reference(reference_number)
  ccd_object.assert_primary_reference(reference_number)
  ccd_object.assert_primary_claimants(@claimant)
  ccd_object.assert_primary_representative(@representative)
  ccd_object.assert_primary_employment(@employment)
  ccd_object.assert_primary_respondent(@respondent.first)
  ccd_object.assert_secondary_respondents(@respondent.drop(1))
end

