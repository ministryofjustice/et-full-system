@e2e
@javascript
Feature: Admin roles and permissions
  As an ET Admin system
  I want to ensure that roles only have the permissions assigned to that user role

  Scenario: Create roles for admin functions
    When an administrator login
    And import 'dummy.test' users
    Then users successfully imported
  
  Scenario: Delete roles for admin functions
    When an administrator login
    Then admin user can delete users

  Scenario: Admin User - Provide access to all ET admin functions including add/remove users and user role maintenance
   When an administrator login
   Then I should have full access to ET admin

  Scenario: Super User - Allow viewing of the submitted Claim and Response forms and to maintain Office Postcode coverage definitions
   When a 'superuser' login
   Then I should have partial access to ET admin

  Scenario: User - Typical day-to-day ET Admin functions e.g Acas certificate and view office postcodes
    When a 'user' login
    Then I should have basic access to ET admin