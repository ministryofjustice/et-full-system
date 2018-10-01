@javascript
Feature: Create new user
  As an Super or Admin user
  I want to be able to add, edit and delete users who are no longer working for MOJ

  Background: 
    When an administrator login
    And load User page

  Scenario: Add new user with 'User' role
    When a new user is created with 'User' role
    Then they should be able to login
    And have basic access to ET admin system

  Scenario: Add new user with 'Super user' role
    When a new user with 'Super user' role is created
    Then they should be able to login
    And have partial access to ET  system

  Scenario: Add new user with 'Super user' role
    When a new user with 'Admin' role is created
    Then they should be able to login
    And have full access to ET admin system