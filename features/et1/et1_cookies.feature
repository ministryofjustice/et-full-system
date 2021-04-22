@et1 @javascript
Feature: Cookies

  Background: I visit the home page
    Given a claimant is on the Apply page

  Scenario: Cookie Banner is present
    Then I see the cookie banner is present

  Scenario: Cookie Banner is accepted
    When I accept the cookies
    Then I see the cookie banner is not present

  Scenario: Cookie Banner is accepted
    When I reject the cookies
    Then I see the cookie banner is not present