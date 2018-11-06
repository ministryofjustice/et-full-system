require_relative './base.rb'
module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class EmploymentDetailsSection < EtFullSystem::Test::FileObjects::Et1PdfFileSection::Base
          def has_contents_for?(employment:, errors:, indent:)
            validate_fields section: :employment_details, errors: errors, indent: indent do
              expected_values = {
                  job_title: employment.try(:job_title),
                  start_date: employment.try(:start_date),
                  employment_continuing: yes_no_for(employment.try(:end_date).nil? || date_in_future(employment.try(:end_date), optional: true).present?).downcase,
                  ended_date: date_in_past(employment.try(:end_date), optional: true) || '',
                  ending_date: date_in_future(employment.try(:end_date), optional: true) || ''
              }
              expect(mapped_field_values).to include expected_values
            end
          end
        end
      end
    end
  end
end
