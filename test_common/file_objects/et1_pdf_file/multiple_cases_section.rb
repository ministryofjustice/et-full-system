module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class MultipleCasesSection < Base
          def has_contents_for?(claim:, errors:, indent:)
            validate_fields section: :multiple_cases, errors: errors, indent: indent do
              # claimant.title is a selection of options - in this case we are interested in the key thats all - do not translate it
              expected_values = {
                  field_name('multiple_cases', 'have_similar_claims') => claim.other_claimants.downcase,
                  field_name('multiple_cases', 'other_claimants') => claim.other_claimant_names
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end