@wip
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

#   Scenario: Download a ACAS Certificate
#     Given I am an ACAS administrator
#     When I enter an ACAS certificate number in the ACAS search field
#     Then I can download the contents of the acas document

  Scenario: Certificate not found
   Given I am an ACAS administrator
   When I enter a not found ACAS certificate number
   Then the system should return feedback from acas 'No certificate returned from ACAS for R000201/18/68'

  Scenario: Invalid format
   Given I am an ACAS administrator
   When I enter an invalid format ACAS certificate number
   Then the system should return feedback from acas 'Please enter a valid certificate number'

  Scenario: Server error
   Given I am an ACAS administrator
   When I enter a 'server error' ACAS certificate number
   Then the system should return feedback from acas 'There was a problem with the ACAS service -  please try again later'

#   Scenario: ACAS log
#     Given I am an ET Administrator with full privileges 
#     When I view the ACAS Certificate Access log
#     And sort by the Date field
#     Then I can see who has downloaded the ACAS document
    
#   Scenario: No response from ACAS
#     Given I am an ACAS administrator
#     When I enter an ACAS certificate number in the ACAS search field
#     And an ACAS server is down for an unknown reason
#     Then the ET Admin should timeout after 3 seconds displaying 'Something has gone wrong, please try again later'

#   @manual
#   Scenario: ACAS AWS log
#     Given I am part of the devops team
#     When there is an error in our ACAS Admin section
#     Then I should be able to view AWS log which track ACAS error
