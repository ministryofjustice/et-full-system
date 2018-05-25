Given(/^an employers response$/) do
  @claimant = FactoryBot.create(:et3_claimant)
  @respondent = FactoryBot.create(:et3_respondent)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
end
