@e2e
@javascript
Feature: Admin roles and permissions
  As an ET Admin system
  I want to ensure that roles only have the permissions assigned to that user role

  Scenario: Create roles for admin functions
    When an administrator login
    And import new users
    Then new users have sucessfully been imported

  Scenario: Admin User
   When an administrator login
   Then I should have full access to ET admin

  Scenario: Super User
   When a 'superuser' login
   Then I should have partial access to ET admin

  Scenario: Basic User
    When a 'user' login
    Then I should have basic access to ET admin