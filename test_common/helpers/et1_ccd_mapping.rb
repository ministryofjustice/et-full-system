module EtFullSystem
  module Test
    module Et1CcdMapping
      include ::EtFullSystem::Test::I18n
      include RSpec::Matchers
      
      def json_object(data)
        hash = data[0].to_h
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
          "caseType" => "Single"
        }
      end

      def claimant_ind_type(data)
        et1_online_data = json_object(data)
        { 
          "claimantIndtype" => {
            "claimant_gender" => et1_online_data[:gender],
            "claimant_title1" => et1_online_data[:title],
            "claimant_last_name" => et1_online_data[:last_name],
            "claimant_first_names" => et1_online_data[:first_name],
            "claimant_date_of_birth" => Date.parse(et1_online_data[:date_of_birth]).strftime("%Y-%m-%d")
          }
        }
      end

      def representativeClaimantType(data)
        et1_online_data = json_object(data)
        {
          "representativeClaimantType" => {
            "representative_dx" => et1_online_data[:dx_number],
            "name_of_organisation" => et1_online_data[:organisation_name],
            "name_of_representative" => et1_online_data[:name],
            "representative_address" => {
              "County" => t1_online_data[:county],
              "PostCode" => t1_online_data[:post_code],
              "PostTown" => t1_online_data[:locality],
              "AddressLine1" => t1_online_data[:building],
              "AddressLine2" => t1_online_data[:street]
            },
            "representative_occupation" => t1_online_data[:type],
            "representative_phone_number" => t1_online_data[:telephone_number],
            "representative_email_address" => t1_online_data[:email_address],
            "representative_mobile_number" => t1_online_data[:alternative_telephone_number]
          }
        }
      end

      def claimantWorkAddress(data)
        et1_online_data = json_object(data)
        {
          "claimantWorkAddress" => {
            "claimant_work_address" => {
              "County" => et1_online_data[:work_county],
              "PostCode" => et1_online_data[:work_post_code],
              "PostTown" => et1_online_data[:work_locality],
              "AddressLine1" => et1_online_data[:work_building],
              "AddressLine2" => et1_online_data[:work_street]
            },
            "claimant_work_phone_number" => [et1_online_data:work_telephone_number]
          }
        }
      end

      def respondent_sum_type(data)
        et1_online_data = json_object(data)
        {
          "respondentSumType" => {
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
        }
      end

      def claimant_type(data)
        et1_online_data = json_object(data)
        {
          "claimantType" => {
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
        }
      end
    end
  end
end