And(/^the administrator exports the claim to the scotland office$/) do
  # Look up and wait for the claim to be processed.  A user would typically not need to do this as they are not as fast as this test suite
  claim = admin_api.processed_claim(application_reference: @claim_application_reference)

  admin_pages.login_page.load
  admin_pages.login_page.login
  admin_pages.claims_page.load
  admin_pages.claims_page.list_not_exported_to_ccd
  admin_pages.claims_page.export_claim(claim['reference'], 'CCD Glasgow')
end