When(/^I submit a completed ET3 form$/) do
  et3_helper.answer_all_questions
  et3_helper.confirmation_of_supplied_details_page.submit_form
end


And(/^I take note of my ET3 reference number$/) do
  @my_et3_reference = et3_helper.form_submission_page.reference_number.text
end
