@e2e
@javascript
Feature:
  As an ACAS administrator
  I want to download a certificate/document from the ET Admin
  So I can validate the certificate number and its contents
  And view logs detailing user access and error messages

  Scenario: Download and view ACAS Certificate
    Given I am an ACAS administrator
    When I enter an ACAS certificate number
    Then I can download and view the contents of the document

  Scenario: Certificate not found
    Given I am an ACAS administrator
    When I enter an invalid ACAS certificate number
    Then the system should return 'No certifciate returned from ACAS for AC123456/78/90'

  Scenario: Invalid format
    Given I am an ACAS administrator
    When I enter an invalid format ACAS number
    Then the system should return 'Please enter a valid certificate number'

  Scenario: ACAS log
    Given I am an ET Administrator with full privileges 
    When I view the ACAS Certificate Access log
    And sort by the Date field
    Then I can see who has downloaded the ACAS document
    
  Scenario: No response from ACAS
    Given I am an ACAS administrator
    When I enter an ACAS certificate number
    And an ACAS server is down for unknown reason
    Then the ET Admin should timeout after 3 seconds displaying 'Something has gone wrong, please try again later'

  @manual
  Scenario: ACAS AWS log
    Given I am part of the devops team
    When there is an error in our ACAS Admin section
    Then I should be able to view AWS log which track ACAS error