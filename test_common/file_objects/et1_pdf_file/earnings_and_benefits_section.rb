require_relative './base.rb'
module EtFullSystem
  module Test
    module FileObjects
      module Et1PdfFileSection
        class EarningsAndBenefitsSection < EtFullSystem::Test::FileObjects::Et1PdfFileSection::Base
          def has_contents_for?(employment:)
            if employment.employment_details == :"claims.employment.yes"
              expected_values = {
                average_weekly_hours: employment.try(:average_weekly_hours).try(:to_f).try(:to_s),
                pay_before_tax: pay_tax(employment.try(:pay_before_tax), employment.pay_before_tax_type.to_s.split('.').last),
                pay_after_tax: pay_tax(employment.try(:pay_after_tax), employment.pay_after_tax_type.to_s.split('.').last),
                paid_for_notice_period: boolean_or_nil(employment.paid_for_notice_period, :"claims.employment.yes"),
                notice_period: notice_period(employment.notice_period, employment.notice_period_type),
                employers_pension_scheme: employers_pension_scheme(employment),
                benefits: employment.try(:benefits)
              }
            else
              expected_values = {
                average_weekly_hours: nil,
                pay_before_tax: {
                    'amount': nil,
                    'period': nil
                },
                paid_for_notice_period: nil,
                notice_period: {
                    weeks: nil,
                    months: nil
                },
                employers_pension_scheme: nil,
                benefits: nil
              }
            end
            expect(mapped_field_values).to include expected_values
          end

          private

          def boolean_or_nil(value, true_value)
            return nil if value.nil?

            value == true_value
          end

          def employers_pension_scheme(employment)
            return nil if employment.nil?
            employment.employers_pension_scheme.to_s.split('.').last.downcase == 'true'
          end

          def notice_period(notice_period, notice_period_type)
            key = notice_period_type.to_s.split('.').last
            if key == "months"
              {:weeks=>"", :months=>"#{notice_period}.0"}
            elsif key == "weeks"
              {:weeks=>"#{notice_period}.0", :months=>""}
            else
              {:weeks=>"", :months=>""}
            end
          end

          def pay_tax(amount, period)
              {:amount=>"#{amount}", :period=>"#{period}"}
          end
        end
      end
    end
  end
end
