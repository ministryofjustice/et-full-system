@e2e
@javascript
Feature:
  As an ACAS administrator
  I want to download a certificate/document from the ET Admin
  So I can validate the certificate number and its contents
  And view logs detailing user access and error messages

  Scenario: View an ACAS Certificate's data
   Given I am an ACAS administrator
   When I enter an ACAS certificate number in the ACAS search field
   Then I can view the contents of the acas document

  Scenario: Download a ACAS Certificate
   Given I am an ACAS administrator
   When I enter an ACAS certificate number in the ACAS search field
   Then I can download the contents of the acas document

  Scenario: Invalid format
   Given I am an ACAS administrator
   When I enter an invalid format ACAS certificate number
   Then the system should return feedback from acas 'Please enter a valid certificate number'

#   Scenario: ACAS log
#     Given I am an ET Administrator with full privileges 
#     When I view the ACAS Certificate Access log
#     And sort by the Date field
#     Then I can see who has downloaded the ACAS document