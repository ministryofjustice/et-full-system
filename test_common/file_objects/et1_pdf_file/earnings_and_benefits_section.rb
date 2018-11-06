module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class EarningsAndBenefitsSection < EtFullSystem::Test::FileObjects::Et1PdfFileSection::Base
          def has_contents_for?(employment:, errors:, indent:)
            validate_fields section: :earnings_and_benefits, errors: errors, indent: indent do
              expected_values = {
                average_weekly_hours: employment.average_weekly_hours.to_f.to_s,
                pay_before_tax: {
                  'amount': employment.pay_before_tax,
                  'period': employment.pay_before_tax_type.to_s.split('.').last
                },
                paid_for_notice_period: tri_state_for(employment.paid_for_notice_period),
                notice_period: {
                  weeks: weekly_notice_period(employment.notice_period) || '',
                  months: monthly_notice_period(employment.notice_period) || ''
                },
                employers_pension_scheme: employers_pension_scheme(employment),
                benefits: employment.benefits
              }
              expect(mapped_field_values).to include expected_values
            end
          end

          private

          def employers_pension_scheme(employment)
            true_false = employment.employers_pension_scheme.to_s.split('.').last.downcase
            if true_false == "true"
              'yes'
            elsif true_false == "false"
              'no'
            else
              raise "Unexpected value for employers_pension_scheme - #{employment.employers_pension_scheme}"
            end
          end


          def weekly_notice_period(notice_period)
            amount, period = notice_period.split(' ')
            period == 'Weekly' ? amount : nil
          end

          def monthly_notice_period(notice_period)
            amount, period = notice_period.split(' ')
            period == 'Monthly' ? amount : nil
          end
        end
      end
    end
  end
end
