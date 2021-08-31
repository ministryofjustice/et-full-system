require 'rspec/matchers'
require 'pdf-forms'
require_relative '../base_pdf_file'
module EtFullSystem
  module Test
    module FileObjects
      # Represents the ET3 PDF file and provides assistance in validating its contents
      module Et1PdfFileSection
        class Base < ::EtFullSystem::Test::FileObjects::BasePdfFile

          UndefinedField = Object.new

          private

          def i18n_section
            self.class.name.demodulize.underscore.gsub(/_section\z/, '')
          end

          def mapped_field_values
            return @mapped_field_values if defined?(@mapped_field_values)
  
            lookup = t("claim_pdf_fields.#{i18n_section}", locale: ::EtFullSystem::Test::Messaging.instance.current_locale)
            @mapped_field_values = lookup.inject({}) do |acc, (key, value)|
              v = mapped_value(value, key: key, path: [i18n_section])
              acc[key.to_sym] = v unless v === UndefinedField # rubocop:disable Style/CaseEquality
              acc
            end
          end

          def mapped_value(value, key:, path:)
            if value.is_a?(Hash) && !value.key?(:field_name)
              value.inject({}) do |acc, (inner_key, inner_value)|
                v = mapped_value(inner_value, key: inner_key, path: path + [key.to_s])
                acc[inner_key] = v unless v == UndefinedField
                acc
              end
            elsif value.is_a?(Hash) && value[:field_name] == false
              UndefinedField
            else
              field_value_for(value, key: key, path: path)
            end
          end

          def field_value_for(value, key:, path:)
            if value.key?(:select_values)
              raw = raw_value_from_pdf(value)
              ret = value[:select_values].detect { |(_, v)| v == raw }.try(:first)
              return ret if ret == true || ret == false
              return ret.to_s if ret
              if value[:unselected_value].is_a? Array
                return nil if value[:unselected_value].include?(raw) || value[:unselected_value] == raw
              else
                return nil if value[:unselected_value] == raw
              end  
              raise "Invalid value - '#{raw}' is not in the selected_values list or the unselected_value for field '#{path.join('.')}.#{key}' ('#{value[:field_name]}') for section #{self.class.name}"
            else
              field_values[value[:field_name]]
            end
          end

          def raw_value_from_pdf(value)
            value[:field_name].is_a?(Array) ? value[:field_name].map { |f| field_values[f] } : field_values[value[:field_name]]
          end

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
            Time.parse(date).strftime('%d/%m/%Y')
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
          def gender_for(val, optional: false)
            return nil if val.nil? && optional

            val.to_s.split('.').last
          end

          # Converts a translation symbol to the correct value for the pdf - at present they seem to be the same
          # but they dont have to be - so any translation to be done in here.
          def contact_preference_for(val)
            val.to_s.split('.').last
          end

          # Postcodes in the pdf have no spaces in them, but the inputs might.  Also, the pdf
          # will only ever remember the first 7 characters
          def post_code_for(val, optional: false)
            return nil if val.nil? && optional
            match = val.match(/\A\s*(\S+)\s*(\d\w\w)\s*\z/)
            return val.slice(0,7) unless match
            spaces = 4 - match[1].length
            val = "#{match[1]}#{' ' * spaces}#{match[2]}"
            val.slice(0,7)
          end

          def date_in_past(date, optional: false)
            return nil if date.nil? && optional
            d = date_for(date)
            Date.parse(d) < Date.today ? d : nil
          end

          def date_in_future(date, optional: false)
            return nil if date.nil? && optional
            d = date_for(date)
            Date.parse(d) > Date.today ? d : nil
          end

          def outcome_type_for(outcome_type)
            case outcome_type.to_s.split('.').last.to_sym
            when :compensation_only then
              :prefer_compensation
            when :tribunal_recommendation then
              :prefer_recommendation
            when :reinstated_employment_and_compensation then
              :prefer_re_instatement
            when :new_employment_and_compensation then
              :prefer_re_engagement
            else
              raise "Unknown outcome type of #{outcome_type} - please add it to et1_pdf_file.rb in the outcome_type_for method"
            end
          end

          def outcome_types_for(outcome_types)
            outcome_types.map {|type| outcome_type_for(type)}
          end
        end
      end
    end
  end
end
