@javascript
Feature:
  As an ET Admin User
  I want to log onto the ET Admin section and be able to supply a postal Claimant's workplace Postcode
  So that I can receive the next Claim sequence number

  Background: 
    Given an administrator login
    And load Generate Reference page

  Scenario: Geneate new reference number
    When I enter a postcode 'N1 1PA' 
    Then I can retrieve the next Claim sequence number