Given(/^an employer responds to a claim$/) do
  @claimant = FactoryBot.create(:et3_claimant)
  @respondent = FactoryBot.create(:et3_respondent)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
end

Given(/^an employer responds to a claim with no respresentative$/) do
  @claimant = FactoryBot.create(:et3_claimant)
  @respondent = FactoryBot.create(:et3_respondent)
  @representative = FactoryBot.create_list(:representative, 1, :et3_no_representative)
end

Given(/^an employer responds to yes to emloyment start date$/) do
  @claimant = FactoryBot.create(:et3_claimant, agree_with_employment_dates: 'Yes')
  @respondent = FactoryBot.create(:et3_respondent)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
end