Given(/^I am making a claim$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^I am making a claim with no respresentative$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^I am making a claim with one other person$/) do
  @claimants = FactoryBot.create_list(:first_person, 2, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^I am making a claim with 7 other people$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :group_claims)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^I am making a claim using a separate document$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create_list(:claim, 1, :upload_your_claim_statement)[0]
end

Given(/^I am making a claim against 3 employers$/) do
  @claimants = FactoryBot.create_list(:first_person, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 3, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end