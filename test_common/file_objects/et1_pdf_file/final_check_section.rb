module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class FinalCheckSection < Base
          # Note - I have included this for completeness - but I do not think the field ever gets populated
          def has_contents_for?(errors:, indent:)
            validate_fields section: :final_check, errors: errors, indent: indent do
              expected_values = {
                  satisfied: nil
              }
              expect(mapped_field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
