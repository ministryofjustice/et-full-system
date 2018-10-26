module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class WhatDoYouWantSection < Base
          def has_contents_for?(claim:, errors:, indent:)
            validate_fields section: :what_do_you_want, errors: errors, indent: indent do
              expected_values = {
                  field_name('what_do_you_want', 'prefer_re_instatement') => yes_no_for(outcome_type_for(claim.preferred_outcome) == :prefer_re_instatement, yes: 'yes', no: 'Off'),
                  field_name('what_do_you_want', 'prefer_re_engagement') => yes_no_for(outcome_type_for(claim.preferred_outcome) == :prefer_re_engagement, yes: 'yes', no: 'Off'),
                  field_name('what_do_you_want', 'prefer_compensation') => yes_no_for(outcome_type_for(claim.preferred_outcome) == :prefer_compensation, yes: 'yes', no: 'Off'),
                  field_name('what_do_you_want', 'prefer_recommendation') => yes_no_for(outcome_type_for(claim.preferred_outcome) == :prefer_recommendation, yes: 'yes', no: 'Off'),
                  field_name('what_do_you_want', 'compensation') => claim.preferred_outcome_notes
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
