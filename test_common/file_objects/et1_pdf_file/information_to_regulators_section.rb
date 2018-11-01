module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class InformationToRegulatorsSection < Base
          def has_contents_for?(claim:, errors:, indent:)
            validate_fields section: :information_to_regulators, errors: errors, indent: indent do
              expected_values = {
                  whistle_blowing: yes_no_for(claim.whistleblowing_claim, yes: 'yes', no: 'no'),
              }
              expect(mapped_field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
