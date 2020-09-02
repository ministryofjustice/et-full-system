Given("a claimant is on the Your feedback page") do
  load_et1_start_page
  et1_apply_page.feedback_notice.feedback_link.click
  expect(et1_your_feedback_page.header.text).to be_truthy
end

Then("Your feedback page copy texts are displayed in the correct language") do
  expect(et1_your_feedback_page.has_correct_translation?).to be true
end

Then("I should see thank you on your feedback message") do
  expect(et1_your_feedback_page.flash_heading).to have_flash_message
end

When(/I submit Your feedback delaying (\d+) seconds/) do |delay|
  @email_address = 'anonymous@example.com'
  @unique_string = SecureRandom.hex 10
  et1_submit_your_feedback(@email_address, @unique_string, delay: delay.to_i)
end

Then("email notification came from anonymous person") do
  et1_feedback = EtFullSystem::Test::Et1FeedbackHtml.find(email_address: @email_address)
  expect(et1_feedback.has_correct_email_address?(@email_address)).to be true
  expect(et1_feedback.has_correct_subject_for_feedback_submitted?).to be true
end

When(/I submit Your feedback form with a valid email address delaying (\d+) seconds/) do |delay|
  @unique_string = SecureRandom.hex 10
  @email_address = "#{@unique_string}@hmcts.net"
  
  et1_submit_your_feedback(@email_address, @unique_string, delay: delay.to_i)
end

Then("I should see user's email address shown in the address form") do
  et1_feedback = EtFullSystem::Test::Et1FeedbackHtml.find(email_address: @email_address)
  expect(et1_feedback.has_correct_email_address?(@email_address)).to be true
  expect(et1_feedback.has_correct_subject_for_feedback_submitted?).to be true
end

