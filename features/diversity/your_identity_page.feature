@wip @diversity @javascript

Feature: Your identity page

Scenario: Successfully submits answers about my sexual identity
  Given I am on your identity page
  When I successfully submit all the answers about my identity
  Then I should be taken to the relationship status page

Scenario: Continue without providing answers about my sexual identity
  Given I am on your identity page
  When I continue without providing an answer to my identity
  Then I should be taken to the relationship status page
