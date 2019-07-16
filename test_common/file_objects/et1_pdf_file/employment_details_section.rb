require_relative './base.rb'
module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class EmploymentDetailsSection < EtFullSystem::Test::FileObjects::Et1PdfFileSection::Base
          def has_contents_for?(employment:)
            if employment.employment_details == :"claims.employment.yes"
              expected_values = {
                job_title: employment.job_title,
                start_date: employment.start_date,
                employment_continuing: employment.end_date.empty? || date_in_future(employment.end_date).present?,
                ended_date: employment.end_date,
                ending_date: employment.notice_period_end_date
              }
            else
              expected_values = {
                job_title: nil,
                start_date: nil,
                employment_continuing: nil,
                ended_date: nil,
                ending_date: nil
              }
            end
            expect(mapped_field_values).to include expected_values
          end
        end
      end
    end
  end
end
