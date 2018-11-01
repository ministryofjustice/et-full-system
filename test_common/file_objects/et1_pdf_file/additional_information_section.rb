module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class AdditionalInformationSection < Base
          def has_contents_for?(claim:, errors:, indent:)
            validate_fields section: :additional_information, errors: errors, indent: indent do
              expected_values = {
                  additional_information: claim.other_important_details
              }
              expect(mapped_field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
