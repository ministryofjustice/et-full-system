@e2e
@javascript
Feature: Manage postcodes assigned to local offices
  As a Super or Admin user
  I want to manage the postcodes assigned to local offices
  So that applications continue to be sent to the right office
    

  Scenario: Add new postcode
    Given an administrator login
    When a new postcode is added to the default local office address
    Then the new postcode is saved on the system