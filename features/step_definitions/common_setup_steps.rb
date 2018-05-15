Given(/^I am making a claim$/) do
  @claimant = FactoryBot.create(:first_person)
  @representative = FactoryBot.create(:representative)
  @respondent = FactoryBot.create(:respondent)
  @employment = FactoryBot.create(:employment)
end

Given(/^I am making a claim with no respresentative$/) do
  @claimant = FactoryBot.create(:first_person)
  @respondent = FactoryBot.create(:respondent)
  @employment = FactoryBot.create(:employment)
end

Given(/^I am making a claim with one other person$/) do
  @claimant = FactoryBot.create(:first_person)
  @group_claims = FactoryBot.create_list(:group_claims, 1, :person_data)
  @representative = FactoryBot.create(:representative)
  @respondent = FactoryBot.create(:respondent)
  @employment = FactoryBot.create(:employment)
end

