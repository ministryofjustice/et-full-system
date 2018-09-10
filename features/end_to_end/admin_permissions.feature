@e2e
@javascript
Feature: Employment Tribunal 
  As an ET Admin system
  I want to ensure that roles only have the permissions assigned to that user role

  Scenario: Admin User
   When an administrator login
   Then I should have full access to ET admin

  Scenario: Super User
   When a super login
   Then I should have partial access to ET admin

  Scenario: Normal User
    When a normal user login
    Then I should have basic access to ET admin