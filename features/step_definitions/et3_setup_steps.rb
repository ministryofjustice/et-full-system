Given(/^I am the respondent "([^"]*)" with a unique first name$/) do |name|
  et3_helper.given_i_am(name.to_sym)
end
