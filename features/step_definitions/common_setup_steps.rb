Given(/^I am making a claim$/) do
  @claimant = FactoryBot.create(:claimant).to_h
  @representative = FactoryBot.create(:representative).to_h
  @respondent = FactoryBot.create(:respondent).to_h
  @employment = FactoryBot.create(:employment).to_h
end
