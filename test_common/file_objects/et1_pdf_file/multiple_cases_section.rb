module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class MultipleCasesSection < EtFullSystem::Test::FileObjects::Et1PdfFileSection::Base
          def has_contents_for?(claim:, errors:, indent:)
            validate_fields section: :multiple_cases, errors: errors, indent: indent do
              # claimant.title is a selection of options - in this case we are interested in the key thats all - do not translate it
              expected_values = {
                  have_similar_claims: claim.other_claimants.to_s.split('.').last.downcase,
                  other_claimants: claim.other_claimant_names
              }
              expect(mapped_field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
