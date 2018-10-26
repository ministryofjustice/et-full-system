module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class AdditionalRespondentsDetailsSection < Base
          def has_contents_for?(respondents:, errors:, indent:)
            validate_fields section: :respondents_details, errors: errors, indent: indent do
              # claimant.title is a selection of options - in this case we are interested in the key thats all - do not translate it
              expected_values = {
                  field_name('additional_respondents', 'respondent4', 'name') => respondents[3].try(:name),
                  field_name('additional_respondents', 'respondent4', 'building') => respondents[3].try(:building),
                  field_name('additional_respondents', 'respondent4', 'street') => respondents[3].try(:street),
                  field_name('additional_respondents', 'respondent4', 'locality') => respondents[3].try(:locality),
                  field_name('additional_respondents', 'respondent4', 'county') => respondents[3].try(:county),
                  field_name('additional_respondents', 'respondent4', 'post_code') => post_code_for(respondents[3].try(:post_code), optional: true),
                  field_name('additional_respondents', 'respondent4', 'telephone_number') => respondents[3].try(:telephone_number),
                  field_name('additional_respondents', 'respondent4', 'have_acas') => yes_no_for(respondents[3].try(:acas_number), optional: true),
                  field_name('additional_respondents', 'respondent4', 'acas_number') => respondents[3].try(:acas_number),
                  field_name('additional_respondents', 'respondent5', 'name') => respondents[4].try(:name),
                  field_name('additional_respondents', 'respondent5', 'building') => respondents[4].try(:building),
                  field_name('additional_respondents', 'respondent5', 'street') => respondents[4].try(:street),
                  field_name('additional_respondents', 'respondent5', 'locality') => respondents[4].try(:locality),
                  field_name('additional_respondents', 'respondent5', 'county') => respondents[4].try(:county),
                  field_name('additional_respondents', 'respondent5', 'post_code') => post_code_for(respondents[4].try(:post_code), optional: true),
                  field_name('additional_respondents', 'respondent5', 'telephone_number') => respondents[4].try(:telephone_number),
                  field_name('additional_respondents', 'respondent5', 'have_acas') => yes_no_for(respondents[4].try(:acas_number), optional: true),
                  field_name('additional_respondents', 'respondent5', 'acas_number') => respondents[4].try(:acas_number)
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
