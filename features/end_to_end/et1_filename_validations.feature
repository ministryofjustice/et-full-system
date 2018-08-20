@e2e
@javascript
Feature:
  As an ATOS admin
  I want to be able to download completed Employment Tribunal forms
  So I can triage an employees claim against their employer

  Scenario: Filename based on respondent's work address
    Given a claimant submitted an ET1 form without providing a work address 'BS11DZ' 
    Then the address lookup will be based on respondent's work address and will forwarded to 'Bristol Civil and Family Justice Centre, 2 Redcliff Street, Bristol, BS1 6GR'
    And I can download the form and validate that the filname start with '14'

  Scenario: Filename based on respondent's work address is unknown
    Given a claimant submitted an ET1 form without providing a work address 'Z12LL'
    Then the address lookup will be based on respondent's work address and will forwarded to 'Alexandra House, 14-22 The Parsonage, Manchester M3 2JA'
    And I can download the form and validate that the filname start with '99'

  Scenario: Filename based on claimants work address
    Given a claimant submitted an ET1 form with work address WD187SQ
    Then the address lookup will be based on claimant's work address and will be forwarded to '3rd Floor, Radius House, 51 Clarendon Rd, Watford, WD17 1HP'
    And I can download the form and validate that the filname start with '33'

  Scenario: Ignore special characters in first and last name when generating filenames
    When a claimant submitted an ET1 with special characters in the first and last name 
    Then I can download the form and validate in PDF format