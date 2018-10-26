module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class EarningsAndBenefitsSection < Base
          def has_contents_for?(employment:, errors:, indent:)
            validate_fields section: :earnings_and_benefits, errors: errors, indent: indent do
              expected_values = {
                  field_name('earnings_and_benefits', 'average_weekly_hours') => employment.average_weekly_hours.to_f.to_s,
                  field_name('earnings_and_benefits', 'pay_before_tax', 'amount') => employment.pay_before_tax.split(' ').first,
                  field_name('earnings_and_benefits', 'pay_before_tax', 'period') => employment.pay_before_tax.split(' ').last.downcase,
                  field_name('earnings_and_benefits', 'paid_for_notice_period') => tri_state_for(employment.paid_for_notice_period),
                  field_name('earnings_and_benefits', 'notice_period', 'weeks') => weekly_notice_period(employment.notice_period) || '',
                  field_name('earnings_and_benefits', 'notice_period', 'months') => monthly_notice_period(employment.notice_period) || '',
                  field_name('earnings_and_benefits', 'employers_pension_scheme') => employment.employers_pension_scheme.downcase,
                  field_name('earnings_and_benefits', 'benefits') => employment.benefits
              }
              expect(field_values).to include expected_values
            end
          end

          private

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
