Then("I should see valid claim submitted page") do
  if @respondents[0][:work_office]
    office = @respondents[0][:work_office]
  else
    office = @respondents[0][:office]
  end
  expect(et1_claim_submitted.has_correct_translation?(@claimants[0][:claim_number], @claim[:rtf_file], office)).to be true
end

Given("claimant home postcode {string} then submission office will be {string}") do |string, string2|
  @claimants = FactoryBot.create_list(:claimant, 1, :person_data)
  @representatives = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondents = FactoryBot.create_list(:no_work_address, 1, post_code: string, office: string2)
  # @respondents = FactoryBot.create_list(:conciliation_acas_number, 1)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given("claimant work postcode {string} then submission office will be {string}") do |string, string2|
  @claimants = FactoryBot.create_list(:claimant, 1, :person_data)
  @representatives = FactoryBot.create_list(:representative, 1, :et1_information)
  @respondents = FactoryBot.create_list(:no_work_address, 1, post_code: string, office: string2)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end