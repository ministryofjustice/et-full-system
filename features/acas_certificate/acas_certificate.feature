@acas @javascript
Feature:
  As an ACAS administrator
  I want to download a certificate/document from the ET Admin
  So I can validate the certificate number and its contents
  And view logs detailing user access and error messages

  Scenario: Server error
   Given I am an ACAS administrator
   When I enter a 'server error' ACAS certificate number
   Then the system should return feedback from acas 'There was a problem with the ACAS service -  please try again later'
    
