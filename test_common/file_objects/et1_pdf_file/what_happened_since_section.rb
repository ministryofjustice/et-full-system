module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class WhatHappenedSinceSection < Base
          def has_contents_for?(errors:, indent:)
            validate_fields section: :what_happened_since, errors: errors, indent: indent do
              expected_values = {
                  field_name('what_happened_since', 'have_another_job') => tri_state_for(nil),
                  field_name('what_happened_since', 'start_date') => '',
                  field_name('what_happened_since', 'salary') => ''
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
