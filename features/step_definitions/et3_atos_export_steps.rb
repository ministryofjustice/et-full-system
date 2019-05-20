Then(/^I can download the ET3 form and validate in TXT format$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for(reference: @my_et3_reference)
  expect(zip_file.download_file(:et3_response_txt_for, user: @respondent[0], reference: @my_et3_reference)).to match_text_schema calculated_response_matchers(user: @claimant[0], representative: @representative[0], respondent: @respondent[0])
end


Then(/^I can download the ET3 form and validate in PDF format$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for(reference: @my_et3_reference)
  tempfile = zip_file.download_file(:et3_response_pdf_for, user: @respondent[0], reference: @my_et3_reference)
  pdf_file = EtFullSystem::Test::FileObjects::Et3PdfFile.new(tempfile, locale: EtFullSystem::Test::Messaging.instance.current_locale)
  expect(pdf_file).to have_correct_contents_for(response: @claimant[0],
    respondent: @respondent[0],
    representative: @representative[0],
    indent: 1)
end

Then("I can download the ET3 form from the secondary atos and validate that the filename starts with '99'") do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_secondary_interface
  zip_file = api.atos_zip_file_for(reference: @my_et3_reference)
  expect(zip_file.download_file(:et3_filename_start_with, user: @respondent[0], reference: @my_et3_reference, local_postcode: '99')).to be_present
end

Then("I can download the ET3 form and validate that the filename starts with {string}") do |string|
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for(reference: @my_et3_reference)
  expect(zip_file.download_file(:et3_filename_start_with, user: @respondent[0], reference: @my_et3_reference, local_postcode: string)).to be_present
end

Then("it will be forwarded to the Office address {string}") do |string|
  expect(form_submission_page.local_office_address.text).to end_with(string)
end

Then("phone number {string}") do |string|
  form_submission_page.local_office_phone.text == string
end

Then(/^I can download the ET3 form and validate in RTF format$/) do
  api = EtFullSystem::Test::AdminApi.new atos_interface: atos_interface
  zip_file = api.atos_zip_file_for(reference: @my_et3_reference)
  expect(zip_file.download_file(:et3_response_rtf_for, user: @respondent[0], reference: @my_et3_reference)).to be_present
end
