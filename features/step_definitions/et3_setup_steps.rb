# Given(/^I am the respondent "([^"]*)" with a unique first name$/) do |name|
#   et3_helper.given_i_am(name.to_sym)
# end

Given(/^an employers response$/) do
  @claimant = FactoryBot.create(:et3_claimant)
  @respondent = FactoryBot.create(:et3_respondent)
  @representative = FactoryBot.create_list(:representative, 1, :et3_information)
end
