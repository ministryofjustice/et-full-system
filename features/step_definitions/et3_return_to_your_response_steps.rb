Given("I'm a return respondent") do
  start_a_new_et3_response
  @response_number = saving_response_page.main_content.response_number.text
  @respondent = FactoryBot.create_list(:et3_respondent, 1, :et3_respondent_answers, :upload_additional_information, response_number: @response_number)
  et3_answer_saving_response
  @page_left_off = current_url
  page.reset!
  load_et3_start_page
  start_page.return_button.click
end

When("I enter my response details") do
  return_to_your_claim_page.set(@respondent)
  return_to_your_claim_page.find_my_response
end