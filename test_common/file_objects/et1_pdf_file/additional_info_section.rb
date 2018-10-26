module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class AdditionalInfoSection < Base
          def has_contents_for?(claim:, errors:, indent:)
            validate_fields section: :additional_information, errors: errors, indent: indent do
              expected_values = {
                  field_name('additional_information', 'additional_information') => claim.other_important_details
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
