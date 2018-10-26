module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class TypeAndDetailsSection < Base
          # Note that at present, the test framework suggests only one claim type but ET1 can have many selected - this code will need to expect
          # various fields to be Yes/No based on a list of claim types in the future.
          # Also, alot of values have hard coded true or falses as I expect these to come from factories but at the time of writing this there are
          # no values for them - so Im not going mad - calling a method that returns "yes" or "no" - knowing it will always return "no" as I am passing it false
          # it simply to allow for the value to be added at some point soon.
          def has_contents_for?(claim:, errors:, indent:)
            validate_fields section: :type_and_details_of_claim, errors: errors, indent: indent do
              expected_values = {
                  field_name('type_and_details_of_claim', 'unfairly_dismissed') => yes_no_for(claim_type_for(claim.claim_type) == :unfairly_dismissed, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_age') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_age, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_race') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_race, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_gender_reassignment') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_gender_reassignment, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_disability') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_disability, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_pregnancy') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_pregnancy, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_marriage') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_marriage, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_sexual_orientation') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_sexual_orientation, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_sex') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_sex, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'discriminated_religion') => yes_no_for(claim_type_for(claim.claim_type) == :discriminated_religion, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'claiming_redundancy_payment') => yes_no_for(false, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'owed_notice_pay') => yes_no_for(false, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'owed_holiday_pay') => yes_no_for(false, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'owed_arrears_of_pay') => yes_no_for(false, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'owed_other_payments') => yes_no_for(false, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'other_type_of_claim') => yes_no_for(false, yes: 'yes', no: 'Off'),
                  field_name('type_and_details_of_claim', 'other_type_of_claim_details') => '',
                  field_name('type_and_details_of_claim', 'claim_description') => claim.description
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
