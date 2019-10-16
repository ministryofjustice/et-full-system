And(/^the administrator exports the claim to the scotland office$/) do
  # Look up and wait for the claim to be processed.  A user would typically not need to do this as they are not as fast as this test suite
  claim = admin_api.processed_claim(application_reference: @claim_application_reference)

  admin_pages.login_page.load
  admin_pages.login_page.login
  admin_pages.claims_page.load
  admin_pages.claims_page.list_not_exported_to_ccd
  admin_pages.claims_page.export_claim(claim['reference'], 'CCD Glasgow')
end

Then(/^the claim in the admin should show that the export completely failed to CCD$/) do
  # Look up and wait for the claim to be processed.  A user would typically not need to do this as they are not as fast as this test suite
  claim = admin_api.processed_claim(application_reference: @claim_application_reference)
  admin_api.wait_for_claim_failed_in_ccd_export(claim['reference'], timeout: 90, sleep: 1)

end

Then(/^the claim in the admin should show that the export sent to CCD$/) do
  # Look up and wait for the claim to be processed.  A user would typically not need to do this as they are not as fast as this test suite
  claim = admin_api.processed_claim(application_reference: @claim_application_reference)
  res = admin_api.wait_for_claim_success_in_ccd_export(claim['reference'], timeout: 90, sleep: 1)
  res
end

Then(/^the response in the admin should show that the export sent to CCD$/) do
  admin_api.wait_for_response_success_in_ccd_export(case_number: @respondent.first.case_number)
end