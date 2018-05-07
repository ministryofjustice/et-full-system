When(/^I submit a completed ET3 form$/) do
  et3_helper.answer_all_questions
  et3_helper.confirmation_of_supplied_details_page.submit_form
end
