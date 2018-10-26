module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class EmploymentDetailsSection < Base
          def has_contents_for?(employment:, errors:, indent:)
            validate_fields section: :employment_details, errors: errors, indent: indent do
              expected_values = {
                  field_name('employment_details', 'job_title') => employment.job_title,
                  field_name('employment_details', 'start_date') => employment.start_date,
                  field_name('employment_details', 'employment_continuing') => yes_no_for(employment.end_date.nil? || date_in_future(employment.end_date).present?).downcase,
                  field_name('employment_details', 'ended_date') => date_in_past(employment.end_date, optional: true) || '',
                  field_name('employment_details', 'ending_date') => date_in_future(employment.end_date, optional: true) || ''
              }
              expect(field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
