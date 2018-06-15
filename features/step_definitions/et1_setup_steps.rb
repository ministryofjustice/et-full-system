Given(/^an employee making a claim$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :employer)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^an employee making a claim without a respresentative$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :employer)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^2 employees making a claim$/) do
  @claimants = FactoryBot.create_list(:first_person, 2, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :employer)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^7 employees making a claim by uploading CSV file$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :group_claims)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :employer)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^an employee making a claim by uploading a RTF document$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :employer)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create_list(:claim, 1, :upload_your_claim_statement)[0]
end

Given(/^an employee making a claim against 3 employers$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 3, :employer)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^an claimant work address is BS11DZ$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :employer)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end