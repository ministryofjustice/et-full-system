@e2e
@javascript
Feature: ET1 Claim data is exported to the local office
  Scenario: 'Simple User' makes an ET1 claim with 1 representative and 1 respondent with an administrator validating it comes out via the ATOS interface
    Given I am "simple_user" with a unique first name
    And I am the Claimant
    When I complete an online ET1 form and submit the form
    Then my entered data is formatted into a PDF format file and is available for ATOS to download