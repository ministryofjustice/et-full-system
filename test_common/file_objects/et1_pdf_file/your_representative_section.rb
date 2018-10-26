module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class YourRepresentativeSection < Base
          def has_contents_for?(representative:, errors:, indent:)
            validate_fields section: :your_representative, errors: errors, indent: indent do
              expected_values = {
                  field_name('your_representative', 'name_of_organisation') => representative.organisation_name,
                  field_name('your_representative', 'name_of_representative') => representative.name,
                  field_name('your_representative', 'building') => representative.building,
                  field_name('your_representative', 'street') => representative.street,
                  field_name('your_representative', 'locality') => representative.locality,
                  field_name('your_representative', 'county') => representative.county,
                  field_name('your_representative', 'post_code') => post_code_for(representative.post_code),
                  field_name('your_representative', 'dx_number') => representative.dx_number,
                  field_name('your_representative', 'telephone_number') => representative.telephone_number,
                  field_name('your_representative', 'alternative_telephone_number') => representative.alternative_telephone_number,
                  field_name('your_representative', 'reference') => nil, # Should be populated by ET1 but it isnt yet
                  field_name('your_representative', 'email_address') => representative.email_address,
                  field_name('your_representative', 'communication_preference') => 'Off', # ET1 Doesnt capture this
                  field_name('your_representative', 'fax_number') => nil # ET1 Doesnt capture this
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
