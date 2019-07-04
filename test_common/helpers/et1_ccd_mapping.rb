module EtFullSystem
  module Test
    module Et1CcdMapping
      include ::EtFullSystem::Test::I18n
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
            "claimant_date_of_birth" => et1_online_data[:date_of_birth]
          }
        }
      end

      def representativeClaimantType(data)
        et1_online_data = json_object(data)
        {
          "representativeClaimantType" => {
            "representative_dx" => "dx1234567890",
            "name_of_organisation" => "generate dynamic supply-chains",
            "name_of_representative" => "Alphonso Walter",
            "representative_address" => {
              "County" => "Greater London",
              "PostCode" => "SW1H 9PP",
              "PostTown" => "London",
              "AddressLine1" => "106",
              "AddressLine2" => "Mayfair"
            },
            "representative_occupation" => "Solicitor",
            "representative_phone_number" => "01111 123456",
            "representative_email_address" => "sivvoy.taing@hmcts.net",
            "representative_mobile_number" => "02222 654321"
          }
        }
      end

      def claimantWorkAddress(data)
        et1_online_data = json_object(data)
        {
          "claimantWorkAddress" => {
            "claimant_work_address" => {
              "County" => "Greater London",
              "PostCode" => "WD18 7SQ",
              "PostTown" => "London",
              "AddressLine1" => "101",
              "AddressLine2" => "Petty France"
            },
            "claimant_work_phone_number"=>"03333 423554"
          }
        }
      end

      def respondent_sum_type(data)
        et1_online_data = json_object(data)
        {
          "respondentSumType" => {
            "respondent_ACAS" => "AC123456/78/90",
            "respondent_name" => "Douglas, Hand and Breitenberg",
            "respondent_phone1" => "02222 321654",
            "respondent_address" => {
              "County" => "Greater London",
              "PostCode" => "SW1H 9QR",
              "PostTown" => "London",
              "AddressLine1" => "1681",
              "AddressLine2" => "Guy Village"
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