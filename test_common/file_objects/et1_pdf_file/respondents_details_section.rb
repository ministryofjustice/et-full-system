module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class RespondentsDetailsSection < Base
          def has_contents_for?(respondents:, errors:, indent:)
            validate_fields section: :respondents_details, errors: errors, indent: indent do
              expected_values = {
                  field_name('respondents_details', 'name') => title_for(respondents.first.name),
                  field_name('respondents_details', 'address', 'building') => respondents.first.building,
                  field_name('respondents_details', 'address', 'street') => respondents.first.street,
                  field_name('respondents_details', 'address', 'locality') => respondents.first.locality,
                  field_name('respondents_details', 'address', 'county') => respondents.first.county,
                  field_name('respondents_details', 'address', 'post_code') => post_code_for(respondents.first.post_code),
                  field_name('respondents_details', 'address', 'telephone_number') => respondents.first.telephone_number,
                  field_name('respondents_details', 'acas', 'have_acas') => yes_no_for(respondents.first.acas_number),
                  field_name('respondents_details', 'acas', 'acas_number') => respondents.first.acas_number,
                  field_name('respondents_details', 'different_address', 'building') => respondents.first.work_address.try(:building) || '',
                  field_name('respondents_details', 'different_address', 'street') => respondents.first.work_address.try(:street) || '',
                  field_name('respondents_details', 'different_address', 'locality') => respondents.first.work_address.try(:locality) || '',
                  field_name('respondents_details', 'different_address', 'county') => respondents.first.work_address.try(:county) || '',
                  field_name('respondents_details', 'different_address', 'post_code') => post_code_for(respondents.first.work_address.try(:post_code), optional: true) || '',
                  field_name('respondents_details', 'different_address', 'telephone_number') => respondents.first.work_address.try(:telephone_number) || '',
                  field_name('respondents_details', 'respondent2', 'name') => title_for(respondents[1].try(:name), optional: true),
                  field_name('respondents_details', 'respondent2', 'address', 'building') => respondents[1].try(:building),
                  field_name('respondents_details', 'respondent2', 'address', 'street') => respondents[1].try(:street),
                  field_name('respondents_details', 'respondent2', 'address', 'locality') => respondents[1].try(:locality),
                  field_name('respondents_details', 'respondent2', 'address', 'county') => respondents[1].try(:county),
                  field_name('respondents_details', 'respondent2', 'address', 'post_code') => post_code_for(respondents[1].try(:post_code), optional: true),
                  field_name('respondents_details', 'respondent2', 'address', 'telephone_number') => respondents[1].try(:telephone_number),
                  field_name('respondents_details', 'respondent2', 'acas', 'have_acas') => yes_no_for(respondents[1].try(:acas_number), optional: true),
                  field_name('respondents_details', 'respondent2', 'acas', 'acas_number') => respondents[1].try(:acas_number),
                  field_name('respondents_details', 'respondent3', 'name') => title_for(respondents[2].try(:name), optional: true),
                  field_name('respondents_details', 'respondent3', 'address', 'building') => respondents[2].try(:building),
                  field_name('respondents_details', 'respondent3', 'address', 'street') => respondents[2].try(:street),
                  field_name('respondents_details', 'respondent3', 'address', 'locality') => respondents[2].try(:locality),
                  field_name('respondents_details', 'respondent3', 'address', 'county') => respondents[2].try(:county),
                  field_name('respondents_details', 'respondent3', 'address', 'post_code') => post_code_for(respondents[2].try(:post_code), optional: true),
                  field_name('respondents_details', 'respondent3', 'address', 'telephone_number') => respondents[2].try(:telephone_number),
                  field_name('respondents_details', 'respondent3', 'acas', 'have_acas') => yes_no_for(respondents[2].try(:acas_number), optional: true),
                  field_name('respondents_details', 'respondent3', 'acas', 'acas_number') => respondents[2].try(:acas_number)
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
