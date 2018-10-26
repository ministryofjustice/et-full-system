require 'rspec/matchers'
require 'pdf-forms'
require_relative '../base_pdf_file'
module EtFullSystem
  module Test
    module FileObjects
      # Represents the ET3 PDF file and provides assistance in validating its contents
      module Et1PdfFileSection
        class Base < ::EtFullSystem::Test::FileObjects::BasePdfFile

          private

          def field_name(*args)
            t("claim_pdf_fields.#{args.join('.')}.field_name")
          end

          def yes_no_for(val, optional: false, yes: 'Yes', no: 'No')
            return nil if val.nil? && optional
            val ? yes : no
          end

          def tri_state_for(val, yes: 'Yes', no: 'No', off: 'Off')
            return off if val.nil?
            val ? yes : no
          end

          def date_for(date)
            return date.strftime('%d/%m/%Y') if date.is_a?(Date) || date.is_a?(Time) || date.is_a?(DateTime)
            Time.zone.parse(date).strftime('%d/%m/%Y')
          end

          def decimal_for(number)
            number.to_s
          end

          # Converts a translation symbol to the correct value for the pdf - at present they seem to be the same
          # but they dont have to be - so any translation to be done in here.
          def title_for(val, optional: false)
            return nil if val.nil? && optional
            val.to_s.split('.').last
          end

          # Converts a translation symbol to the correct value for the pdf - at present they seem to be the same
          # but they dont have to be - so any translation to be done in here.
          def gender_for(val)
            val.to_s.split('.').last
          end

          # Converts a translation symbol to the correct value for the pdf - at present they seem to be the same
          # but they dont have to be - so any translation to be done in here.
          def contact_preference_for(val)
            val.to_s.split('.').last
          end

          # Postcodes in the pdf have no spaces in them, but the inputs might
          def post_code_for(val, optional: false)
            return nil if val.nil? && optional
            val.tr(' ', '')
          end

          def date_in_past(date, optional: false)
            return nil if date.nil? && optional
            d = date_for(date)
            d < Date.today ? d : nil
          end

          def date_in_future(date, optional: false)
            return nil if date.nil? && optional
            d = date_for(date)
            d > Date.today ? d : nil
          end

          def claim_type_for(claim_type)
            case claim_type.to_s.split('.').last.to_sym
            when :is_unfair_dismissal then
              :unfairly_dismissed
            else
              raise "Unknown claim type of #{claim_type} - please add it to et1_pdf_file.rb in the claim_type_for method"
            end
          end

          def outcome_type_for(outcome_type)
            case outcome_type.to_s.split('.').last.to_sym
            when :compensation_only then
              :prefer_compensation
            when :tribunal_recommendation then
              :prefer_receommendation
            when :reinstated_employment_and_compensation then
              :prefer_re_instatement
            when :new_employment_and_compensation then
              :prefer_re_engagement
            else
              raise "Unknown outcome type of #{outcome_type} - please add it to et1_pdf_file.rb in the outcome_type_for method"
            end
          end
        end
      end
    end
  end
end
