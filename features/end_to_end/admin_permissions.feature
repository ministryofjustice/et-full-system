@e2e
@javascript
Feature: Admin roles and permissions
  As an ET Admin system
  I want to ensure that roles only have the permissions assigned to that user role

  Scenario: Admin User
   When an administrator login
   Then I should have full access to ET admin

  Scenario: Super User
   When a 'superuser' login
   Then I should have partial access to ET admin

  Scenario: Basic User
    When a 'user' login
    Then I should have basic access to ET admin