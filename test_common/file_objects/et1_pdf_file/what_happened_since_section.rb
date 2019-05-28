require_relative './base.rb'
module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class WhatHappenedSinceSection < EtFullSystem::Test::FileObjects::Et1PdfFileSection::Base
          def has_contents_for?(employment:)
            if employment.new_job == :"claims.employment.yes"
              expected_values = {
                  have_another_job: employment.new_job.to_s.split('.').last == "yes",
                  start_date: date_for(employment.new_job_start_date),
                  salary: employment.new_job_pay_before_tax
              }
            else
              expected_values = {
                  have_another_job: nil,
                  start_date: be_empty,
                  salary: be_empty
              }
            end
            expect(mapped_field_values).to include expected_values
          end
        end
      end
    end
  end
end
