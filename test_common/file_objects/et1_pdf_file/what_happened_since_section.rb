module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class WhatHappenedSinceSection < EtFullSystem::Test::FileObjects::Et1PdfFileSection::Base
          def has_contents_for?(errors:, indent:)
            validate_fields section: :what_happened_since, errors: errors, indent: indent do
              expected_values = {
                  have_another_job: tri_state_for(nil),
                  start_date: '',
                  salary: ''
              }
              expect(mapped_field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
