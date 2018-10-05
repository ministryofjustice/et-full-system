Given("a claimant is on the Apply page in {string}") do |string|
  I18n.enforce_available_locales = :cy
  et1_new_claim_page.load
  binding.pry
  et1_new_claim_page.feedback_notice.switch_language.text
  et1_new_claim_page.feedback_notice.feedback_link.text
end