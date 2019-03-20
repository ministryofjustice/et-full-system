require_relative './base.rb'
module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class TypeAndDetailsSection < EtFullSystem::Test::FileObjects::Et1PdfFileSection::Base
          # Note that at present, the test framework suggests only one claim type but ET1 can have many selected - this code will need to expect
          # various fields to be Yes/No based on a list of claim types in the future.
          # Also, alot of values have hard coded true or falses as I expect these to come from factories but at the time of writing this there are
          # no values for them - so Im not going mad - calling a method that returns "yes" or "no" - knowing it will always return "no" as I am passing it false
          # it simply to allow for the value to be added at some point soon.
          def has_contents_for?(claim:)
            claim_types = claim_types_for(claim.claim_types)
            expected_values = {
                unfairly_dismissed: claim_types.include?(:is_unfair_dismissal),
                discriminated_age: claim_types.include?(:discrimination_age),
                discriminated_race: claim_types.include?(:discrimination_race),
                discriminated_gender_reassignment: claim_types.include?(:discrimination_gender_reassignment),
                discriminated_disability: claim_types.include?(:discrimination_disability),
                discriminated_pregnancy: claim_types.include?(:discrimination_pregnancy_or_maternity),
                discriminated_marriage: claim_types.include?(:discrimination_marriage_or_civil_partnership),
                discriminated_sexual_orientation: claim_types.include?(:discrimination_sexual_orientation),
                discriminated_sex: claim_types.include?(:discrimination_sex_including_equal_pay),
                discriminated_religion: claim_types.include?(:discrimination_religion_or_belief),
                claiming_redundancy_payment: claim_types.include?(:pay_redundancy),
                owed_notice_pay: claim_types.include?(:pay_notice),
                owed_holiday_pay: claim_types.include?(:pay_holiday),
                owed_arrears_of_pay: claim_types.include?(:pay_arrears),
                owed_other_payments: claim_types.include?(:pay_other),
                other_type_of_claim: claim_types.include?(:is_other_type_of_claim),
                claim_description: claim.description
            }
            expect(mapped_field_values).to include expected_values
          end
        end
      end
    end
  end
end
