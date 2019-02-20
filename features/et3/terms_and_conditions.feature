@et3 @javascript

Feature: Terms and Conditions Page
  As a respondent of a claim
  I would like to know my terms and conditions before submitting my response

Background: Terms and condition page
  When I load the Terms and conditions page from the ET3 landing page

Scenario: Terms and conditions
  Then I should be taken to Terms and Conditions page

Scenario: privacy policy
  When I load privacy policy from the Terms and conditions page
  Then I should be taken to privacy policy page

Scenario: cookie policy
  When I load cookie policy from the Terms and conditions page
  Then I should be taken to cookie policy page

Scenario: Contact us
  When I load Contact us from the Terms and conditions page
  Then I should be taken to Contact us page