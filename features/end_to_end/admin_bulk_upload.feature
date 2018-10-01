@e2e
@javascript
Feature: Admin roles and permissions
  As an ET Admin system
  I want to ensure that roles only have the permissions assigned to that user role

  Background: Import users via csv file
    When an administrator login
    And import 'dummy.test' users
    Then users have successfully imported

  Scenario: Admin User - Provide access to all ET admin functions including add/remove users and user role maintenance
   When a 'Admin' login
   Then I should have full access to ET admin

  Scenario: Super User - Allow viewing of the submitted Claim and Response forms and to maintain Office Postcode coverage definitions
   When a 'Super User' login
   Then I should have partial access to ET admin

  Scenario: User - Typical day-to-day ET Admin functions e.g Acas certificate and view office postcodes
    When a 'User' login
    Then I should have basic access to ET admin