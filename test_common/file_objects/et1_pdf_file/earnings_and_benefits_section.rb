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
                pay_before_tax: pay_tax(employment.try(:pay_before_tax), t(employment.try(:pay_before_tax_type)).downcase),
                pay_after_tax: pay_tax(employment.try(:pay_after_tax), t(employment.try(:pay_after_tax_type)).downcase),
                paid_for_notice_period: tri_state_for(employment.try(:paid_for_notice_period)),
                notice_period: notice_period(employment.try(:notice_period), t(employment.try(:notice_period_type)).downcase),
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
            binding.pry
            expect(mapped_field_values).to include expected_values
          end

          private

          def employers_pension_scheme(employment)
            return nil if employment.nil?
            true_false = employment.employers_pension_scheme.to_s.split('.').last.downcase
            if true_false == "true"
              'yes'
            elsif true_false == "false"
              'no'
            else
              raise "Unexpected value for employers_pension_scheme - #{employment.employers_pension_scheme}"
            end
          end

          def notice_period(notice_period, notice_period_type)
            if notice_period_type == 'months'
              {:weeks=>"", :months=>"#{notice_period}.0"}
            else
              {:weeks=>"#{notice_period}.0", :months=>""}
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
