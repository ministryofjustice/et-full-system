Given(/^an employer responds to a claim$/) do
  @claimant = FactoryBot.create_list(:et3_claimant, 1, :agree_with_employment_dates)
  @respondent = FactoryBot.create_list(:et3_respondent,1, :et3_respondent_answers)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
end

Given(/^an employer responds to a claim with no respresentative$/) do
  @claimant = FactoryBot.create_list(:et3_claimant, 1, :agree_with_employment_dates)
  @respondent = FactoryBot.create_list(:et3_respondent,1, :et3_respondent_answers)
  @representative = FactoryBot.create_list(:representative, 1, :et3_no_representative)
end

Given(/^an employer responds to yes to emloyment start date$/) do
  @claimant = FactoryBot.create_list(:et3_claimant, 1, :disagree_with_employment_dates)
  @respondent = FactoryBot.create_list(:et3_respondent,1, :et3_respondent_answers)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
end

Given(/^an employer responds to a claim with claimant work address BS11DZ$/) do
  @claimant = FactoryBot.create_list(:et3_claimant, 1, :agree_with_employment_dates)
  @respondent = FactoryBot.create_list(:et3_respondent,1, :et3_respondent_answers)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
end