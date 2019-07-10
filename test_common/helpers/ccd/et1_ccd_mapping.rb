module EtFullSystem
  module Test
    module Et1CcdMapping
      include ::EtFullSystem::Test::I18n
      include RSpec::Matchers
      include ::EtFullSystem::Test::AcasExemptionHelper

      def json_object(data)
        hash = data.to_h
        hash.map do |key, value|
          value = t(value) if value.is_a?(Symbol)
          hash[key.to_sym] = value
        end
        return hash
      end

      def ccd_case_details(data)
        {
          "receiptDate" => Time.now.strftime("%Y-%m-%d"),
          "feeGroupReference" => data,
          "claimant_TypeOfClaimant" => "Individual",
          "caseType" => "Single"
        }
      end

      def claimant_ind_type(data)
        et1_online_data = json_object(data)
        if et1_online_data[:gender] == 'Prefer not to say'
          {
            "claimant_title1" => et1_online_data[:title], 
            "claimant_first_names" => et1_online_data[:first_name], 
            "claimant_last_name" => et1_online_data[:last_name], 
            "claimant_date_of_birth" => Date.parse(et1_online_data[:date_of_birth]).strftime("%Y-%m-%d"),
            "claimant_gender" => 'N/K'
          }
        else
          {
            "claimant_title1" => et1_online_data[:title],
            "claimant_first_names" => et1_online_data[:first_name], 
            "claimant_last_name" => et1_online_data[:last_name], 
            "claimant_date_of_birth" => Date.parse(et1_online_data[:date_of_birth]).strftime("%Y-%m-%d"),
            "claimant_gender" => et1_online_data[:gender]
          }
        end
      end

      def representative_claimant_type(data)
        if data['representative_have'] == 'No'
          {
            "claimantRepresentedQuestion" => "No"
          }
        else
          et1_online_data = json_object(data)
          {
            "representative_dx" => et1_online_data[:dx_number],
            "name_of_organisation" => et1_online_data[:organisation_name],
            "name_of_representative" => et1_online_data[:name],
            "representative_address" => {
              "County" => et1_online_data[:county],
              "PostCode" => et1_online_data[:post_code],
              "PostTown" => et1_online_data[:locality],
              "AddressLine1" => et1_online_data[:building],
              "AddressLine2" => et1_online_data[:street]
            },
            "representative_occupation" => et1_online_data[:type],
            "representative_phone_number" => et1_online_data[:telephone_number],
            "representative_email_address" => et1_online_data[:email_address],
            "representative_mobile_number" => et1_online_data[:alternative_telephone_number]
          }
        end
      end

      def claimant_work_address(data)
        et1_online_data = json_object(data)
        {
          "claimant_work_address" => {
            "County" => et1_online_data[:work_county],
            "PostCode" => et1_online_data[:work_post_code],
            "PostTown" => et1_online_data[:work_locality],
            "AddressLine1" => et1_online_data[:work_building],
            "AddressLine2" => et1_online_data[:work_street]
          },
          "claimant_work_phone_number" => et1_online_data[:work_telephone_number]
        }
      end

      def respondent_sum_type(data)
        et1_online_data = json_object(data)
        if data[:acas_number] != nil
          {
            "respondent_ACAS" => et1_online_data[:acas_number],
            "respondent_name" => et1_online_data[:name],
            "respondent_phone1" => et1_online_data[:telephone_number],
            "respondent_address" => {
              "County" => et1_online_data[:county],
              "PostCode" => et1_online_data[:post_code],
              "PostTown" =>et1_online_data[:locality],
              "AddressLine1" => et1_online_data[:building],
              "AddressLine2" => et1_online_data[:street]
            },
            "respondent_ACAS_question"=>"Yes"
          }
        else
          {
            "respondent_name" => et1_online_data[:name],
            "respondent_ACAS_question" => "No",
            "respondent_address" => 
              {
                "County" => et1_online_data[:county],
                "PostCode" => et1_online_data[:post_code],
                "PostTown" =>et1_online_data[:locality],
                "AddressLine1" => et1_online_data[:building],
                "AddressLine2" => et1_online_data[:street]
              },
            "respondent_phone1" => et1_online_data[:telephone_number],
            "respondent_ACAS" => nil,
            "respondent_ACAS_no" => acas_exemption(et1_online_data[:no_acas_number_reason])
          }
        end
      end

      def claimant_type(data)
        et1_online_data = json_object(data)
        if et1_online_data[:country] == "Outside United Kingdom"
          {
            "claimant_addressUK" => {
              "County" => et1_online_data[:county],
              "Country" => nil,
              "PostCode" => et1_online_data[:post_code],
              "PostTown" => et1_online_data[:locality],
              "AddressLine1" => et1_online_data[:building],
              "AddressLine2" => et1_online_data[:street]
              },
            "claimant_phone_number" => et1_online_data[:telephone_number],
            "claimant_mobile_number" => et1_online_data[:alternative_telephone_number],
            "claimant_email_address" => et1_online_data[:email_address],
            "claimant_contact_preference" => et1_online_data[:correspondence]
          } 
        else
          {
            "claimant_addressUK" => {
              "County" => et1_online_data[:county],
              "Country" => et1_online_data[:country],
              "PostCode" => et1_online_data[:post_code],
              "PostTown" => et1_online_data[:locality],
              "AddressLine1" => et1_online_data[:building],
              "AddressLine2" => et1_online_data[:street]
              },
            "claimant_phone_number" => et1_online_data[:telephone_number],
            "claimant_mobile_number" => et1_online_data[:alternative_telephone_number],
            "claimant_email_address" => et1_online_data[:email_address],
            "claimant_contact_preference" => et1_online_data[:correspondence]
          }
        end
      end

      def claimant_other_type(data)
        if data[:employment_details] == :"claims.employment.no"
          {
            "claimant_disabled" => "No"
          }
        else
          et1_online_data = json_object(data)
          if et1_online_data[:notice_period_end_date] != ''
            {
              "claimant_disabled" => "No",
              "claimant_employed_currently" => "Yes", 
              "claimant_occupation" => et1_online_data[:job_title],
              "claimant_employed_from" => Date.parse(et1_online_data[:start_date]).strftime("%Y-%m-%d"),
              "claimant_employed_to" => nil,
              "claimant_employed_notice_period" => Date.parse(et1_online_data[:notice_period_end_date]).strftime("%Y-%m-%d")
            }
          elsif et1_online_data[:notice_period_end_date] == '' && et1_online_data[:end_date] == ''
            {
              "claimant_disabled" => "No",
              "claimant_employed_currently" => "Yes", 
              "claimant_occupation" => et1_online_data[:job_title],
              "claimant_employed_from" => Date.parse(et1_online_data[:start_date]).strftime("%Y-%m-%d"),
              "claimant_employed_to" => nil,
              "claimant_employed_notice_period" => nil
            }
          else et1_online_data[:end_date] != ''
            {
              "claimant_disabled" => "No",
              "claimant_employed_currently" => "Yes", 
              "claimant_occupation" => et1_online_data[:job_title],
              "claimant_employed_from" => Date.parse(et1_online_data[:start_date]).strftime("%Y-%m-%d"),
              "claimant_employed_to" => Date.parse(et1_online_data[:end_date]).strftime("%Y-%m-%d"),
              "claimant_employed_notice_period" => nil
            }
          end
        end
      end
    end
  end
end