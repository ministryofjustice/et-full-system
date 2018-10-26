module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class NotYourEmployerSection < Base
          # Note - I have included this for completeness - but I do not think the field ever gets populated
          def has_contents_for?(errors:, indent:)
            validate_fields section: :respondents_not_your_employer, errors: errors, indent: indent do
              expected_values = {
                  field_name('respondent_not_your_employer', 'claim_type') => nil
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
