module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class YourDetailsSection < Base
          def has_contents_for?(claimant:, errors:, indent:)
            validate_fields section: :your_details, errors: errors, indent: indent do
              expected_values = {
                  field_name('your_details', 'title') => title_for(claimant.title),
                  field_name('your_details', 'first_name') => claimant.first_name,
                  field_name('your_details', 'last_name') => claimant.last_name,
                  field_name('your_details', 'dob_day') => claimant.date_of_birth.split('/')[0],
                  field_name('your_details', 'dob_month') => claimant.date_of_birth.split('/')[1],
                  field_name('your_details', 'dob_year') => claimant.date_of_birth.split('/')[2],
                  field_name('your_details', 'gender') => gender_for(claimant.gender),
                  field_name('your_details', 'building') => claimant.building,
                  field_name('your_details', 'street') => claimant.street,
                  field_name('your_details', 'locality') => claimant.locality,
                  field_name('your_details', 'county') => claimant.county,
                  field_name('your_details', 'post_code') => post_code_for(claimant.post_code),
                  field_name('your_details', 'telephone_number') => claimant.telephone_number,
                  field_name('your_details', 'alternative_telephone_number') => claimant.alternative_telephone_number,
                  field_name('your_details', 'email_address') => claimant.email_address,
                  field_name('your_details', 'correspondence') => contact_preference_for(claimant.correspondence)
              }
              expect(field_values).to include expected_values
            end
          end

        end
      end
    end
  end
end
