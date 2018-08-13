require 'rspec/matchers'
require 'pdf-forms'
module EtFullSystem
  module Test
    module FileObjects
      # Represents the ET3 PDF file and provides assistance in validating its contents
      class Et3PdfFile < Base # rubocop:disable Metrics/ClassLength
        include ::RSpec::Matchers

        def initalize(tempfile)
          self.tempfile = tempfile
        end

        def has_correct_contents_for?(response:, respondent:, representative:, errors: [], indent: 1) # rubocop:disable Naming/PredicateName
          has_header_for?(respondent, errors: errors, indent: indent) &&
          has_claimant_for?(response, errors: errors, indent: indent) &&
          has_respondent_for?(respondent, errors: errors, indent: indent) &&
          has_acas_for?(response, errors: errors, indent: indent) &&
          has_employment_details_for?(response, errors: errors, indent: indent) &&
          has_earnings_for?(response, errors: errors, indent: indent) &&
          has_response_for?(response, errors: errors, indent: indent) &&
          has_contract_claim_for?(respondent, errors: errors, indent: indent) &&
          has_representative_for?(representative, errors: errors, indent: indent) &&
          has_disability_for?(representative, errors: errors, indent: indent)
        end

        def has_header_for?(respondent, errors: [], indent: 1)
          validate_fields section: :header, errors: errors, indent: indent do
            expect(field_values).to include 'case number' => respondent.case_number
            # Date should be todays date, but in case this has ran through midnight - accept the date from 1 hour ago as well
            expect(field_values).to include('date_received' => date_for(Time.now)).or(include('date_received' => date_for(1.hour.ago)))
            expect(field_values).to include 'RTF' => respondent[:rtf_file].blank? ? '' : 'Additional RTF'
          end
        end

        def has_claimant_for?(response, errors: [], indent: 1)
          validate_fields section: :claimant, errors: errors, indent: indent do
            expect(field_values).to include '1.1' => response.claimants_name
          end
        end

        def has_respondent_for?(respondent, errors: [], indent: 1)
          validate_fields section: :respondent, errors: errors, indent: indent do
            expect(field_values).to include '2.1' => respondent.name
            expect(field_values).to include '2.2' => respondent.contact
            expect(field_values).to include '2.3 number or name' => respondent.building_name
            expect(field_values).to include '2.3 street' => respondent.street_name
            expect(field_values).to include '2.3 town city' => respondent.town
            expect(field_values).to include '2.3 county' => respondent.county
            expect(field_values).to include '2.3 postcode' => respondent.postcode.tr(' ', '')
            expect(field_values).to include '2.3 dx number' => respondent.dx_number
            expect(field_values).to include '2.4 phone number' => respondent.contact_number
            expect(field_values).to include '2.4 mobile number' => respondent.contact_mobile_number
            if respondent.contact_preference == 'nil'
              expect(field_values).to include '2.5' => 'Off'
            else
              expect(field_values).to include '2.5' => respondent.contact_preference
            end
            expect(field_values).to include '2.6 email address' => respondent.email_address
            expect(field_values).to include '2.6 fax number' => ''
            expect(field_values).to include '2.7' => respondent.organisation_employ_gb
            expect(field_values).to include '2.8' => respondent.organisation_more_than_one_site.downcase
            expect(field_values).to include '2.9' => ''
          end
        end

        def has_acas_for?(response, errors: [], indent: 1)
          validate_fields section: :acas, errors: errors, indent: indent do
            expect(field_values).to include 'new 3.1' => response.agree_with_early_conciliation_details
            expect(field_values).to include 'new 3.1 If no, please explain why' => response.disagree_conciliation_reason
          end
        end

        def has_employment_details_for?(response, errors: [], indent: 1)
          validate_fields section: :employment, errors: errors, indent: indent do
            expect(field_values).to include '3.1' => response.agree_with_employment_dates.downcase
            expect(field_values).to include '3.1 employment started' => response.employment_start
            expect(field_values).to include '3.1 employment end' => response.employment_end
            expect(field_values).to include '3.1 disagree' => response.disagree_employment
            expect(field_values).to include '3.2' => response.continued_employment.downcase

            if response.agree_with_claimants_description_of_job_or_title == 'nil'
              expect(field_values).to include '3.3' => 'Off'
            else
            expect(field_values).to include '3.3' => response.agree_with_claimants_description_of_job_or_title.downcase
            end
          end
        end

        def has_earnings_for?(response, errors: [], indent: 1)
          validate_fields section: :earnings, errors: errors, indent: indent do
            if response.agree_with_claimants_hours == 'nil'
             expect(field_values).to include '4.1' => 'Off'
             expect(field_values).to include '4.2' => 'Off'
             expect(field_values).to include '4.4 tick box' => 'Off'
             expect(field_values).to include '4.3 tick box' => 'Off'
             expect(field_values).to include '4.3 tick box' => 'Off'
             expect(field_values).to include '4.2 normal take-home pay tick box' => 'Off'
             expect(field_values).to include '4.2 pay before tax tick box' => 'Off'
            else
              expect(field_values).to include '4.1' => response.agree_with_claimants_hours.downcase
              expect(field_values).to include '4.2' => response.agree_with_earnings_details.downcase
              expect(field_values).to include '4.4 tick box' => response.agree_with_claimant_pension_benefits.downcase
              expect(field_values).to include '4.3 tick box' => response.agree_with_claimant_notice.downcase
              expect(field_values).to include '4.3 tick box' => response.agree_with_claimant_notice.downcase
              expect(field_values).to include '4.2 normal take-home pay tick box' => response.queried_take_home_pay_period.downcase
              expect(field_values).to include '4.2 pay before tax tick box' => response.queried_pay_before_tax_period.downcase
            end
            expect(field_values).to include '4.1 if no' => decimal_for(response.queried_hours)
            expect(field_values).to include '4.2 pay before tax' => decimal_for(response.queried_pay_before_tax)
            expect(field_values).to include '4.2 normal take-home pay' => decimal_for(response.queried_take_home_pay)
            expect(field_values).to include '4.3 if no' => response.disagree_claimant_notice_reason
            expect(field_values).to include '4.4 if no' => response.disagree_claimant_pension_benefits_reason
          end
        end

        def has_response_for?(response, errors: [], indent: 1)
          validate_fields section: :response, errors: errors, indent: indent do
            expect(field_values).to include '5.1 tick box' => response.defend_claim.downcase
            expect(field_values).to include '5.1 if yes' => response.defend_claim_facts
          end
        end

        def has_contract_claim_for?(respondent, errors: [], indent: 1)
          validate_fields section: :contract_claim, errors: errors, indent: indent do
            if respondent.make_employer_contract_claim == 'nil'
            expect(field_values).to include '6.2 tick box' => 'Off'
            else
              expect(field_values).to include '6.2 tick box' => respondent.make_employer_contract_claim.downcase
            end
            expect(field_values).to include '6.3' => respondent.claim_information
          end
        end

        def has_representative_for?(representative, errors: [], indent: 1)
          return has_no_representative?(errors: errors, indent: indent) if representative.nil?
          address = representative[:address_attributes]
          validate_fields section: :representative, errors: errors, indent: indent do
            expect(field_values).to include '7.1' => representative.name
            expect(field_values).to include '7.2' => representative.organisation_name
            expect(field_values).to include '7.3 number or name' => representative.building
            expect(field_values).to include '7.3 street' => representative.street
            expect(field_values).to include '7.3 town city' => representative.locality
            expect(field_values).to include '7.3 county' => representative.county
            expect(field_values).to include '7.3 postcode' => representative.post_code.tr(' ', '')
            expect(field_values).to include '7.4' => representative.dx_number
            expect(field_values).to include '7.5 phone number' => representative.telephone_number
            expect(field_values).to include '7.6' => representative.representative_mobile
            expect(field_values).to include '7.7' => representative.representative_reference
            if representative.representative_contact_preference == 'nil'
              expect(field_values).to include '7.8 tick box' => 'Off'
            else
              expect(field_values).to include '7.8 tick box' => representative.representative_contact_preference.downcase
            end
            expect(field_values).to include '7.9' => ''
            expect(field_values).to include '7.10' => representative.representative_fax
          end
        end

        def has_disability_for?(representative, errors: [], indent: 1)
          return has_no_disability?(errors: errors, indent: indent) if representative.nil?
          validate_fields section: :disability, errors: errors, indent: indent do
            if representative.representative_disability == 'nil'
              expect(field_values).to include '8.1 tick box' => 'Off'
            else
              expect(field_values).to include '8.1 tick box' => representative.representative_disability.downcase
            end
            expect(field_values).to include '8.1 if yes' => representative.representative_disability_information
          end
        end

        private

        attr_accessor :tempfile

        def field_values
          @field_values ||= form.fields.inject({}) do |acc, field|
            acc[field.name] = field.value
            acc
          end
        end

        def form
          @form ||= PdfForms.new('pdftk').read(tempfile.path)
        end

        def validate_fields(section:, errors:, indent:)
          aggregate_failures "Match pdf contents to input data" do
            yield
          end
          true
        rescue RSpec::Expectations::ExpectationNotMetError => err
          errors << "Invalid '#{section.to_s.humanize}' section in pdf"
          errors.concat(err.message.lines.map { |l| "#{'  ' * indent}#{l.gsub(/\n\z/, '')}" })
          false
        end

        def date_for(date)
          return date.strftime('%d/%m/%Y') if date.is_a?(Date) || date.is_a?(Time) || date.is_a?(DateTime)
          Time.zone.parse(date).strftime('%d/%m/%Y')
        end

        def decimal_for(number)
          number.to_s
        end

      end
    end
  end
end
