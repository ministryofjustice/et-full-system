Given(/^I am making a claim$/) do
  @claimant = FactoryBot.create(:first_person)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^I am making a claim with no respresentative$/) do
  @claimant = FactoryBot.create(:first_person)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^I am making a claim with one other person$/) do
  @claimant = FactoryBot.create(:first_person)
  @group_claims = FactoryBot.create_list(:group_claims, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^I am making a claim with 7 other people$/) do
  @claimant = FactoryBot.create(:first_person)
  @group_claims_csv = FactoryBot.create(:group_claims_csv)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end

Given(/^I am making a claim using a separate document$/) do
  @claimant = FactoryBot.create(:first_person)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 1, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create_list(:claim, 1, :upload_your_claim_statement)[0]
end

Given(/^I am making a claim against 3 employers$/) do
  @claimant = FactoryBot.create(:first_person)
  @representative = FactoryBot.create(:representative)
  @respondents = FactoryBot.create_list(:organisation_data, 3, :organisation)
  @employment = FactoryBot.create(:employment)
  @claim = FactoryBot.create(:claim)
end