@e2e
@javascript
Feature: Manage postcodes assigned to local offices
  As a Super or Admin user
  I want to manage the postcodes assigned to local offices
  So that applications continue to be sent to the right office

  Background: 
    Given an administrator login

  Scenario: Add new postcode
    When a new postcode 'TT' is added to the 'Default' office
    Then the new postcode is saved on the system

  Scenario: Assign postcode to a different office
    Given a postcode 'TT' is assigned to 'Default' office
    When I reassign the postcode to 'Southampton' office
    Then the postcode will be assigned to the different office and no longer assigned to the original office