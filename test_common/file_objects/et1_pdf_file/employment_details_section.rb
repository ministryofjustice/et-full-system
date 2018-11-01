module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class EmploymentDetailsSection < Base
          def has_contents_for?(employment:, errors:, indent:)
            validate_fields section: :employment_details, errors: errors, indent: indent do
              expected_values = {
                  job_title: employment.job_title,
                  start_date: employment.start_date,
                  employment_continuing: yes_no_for(employment.end_date.nil? || date_in_future(employment.end_date).present?).downcase,
                  ended_date: date_in_past(employment.end_date, optional: true) || '',
                  ending_date: date_in_future(employment.end_date, optional: true) || ''
              }
              expect(mapped_field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
