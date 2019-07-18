module EtFullSystem
  module Test
    module Et1ClaimantType
      def claimant_ind_type(claimant)
        {
          "claimant_title1" => t(claimant[:title]), 
          "claimant_first_names" => claimant[:first_name], 
          "claimant_last_name" => claimant[:last_name], 
          "claimant_date_of_birth" => Date.parse(claimant[:date_of_birth]).strftime("%Y-%m-%d"),
          "claimant_gender" => claimant[:gender].to_s.split(".").last == "prefer_not_to_say" ? "Not Known" : t(claimant[:gender])
        }
      end

      def respondent_sum_type(respondent, secondary: false)
        if acas_number?(respondent)
          {
            "respondent_ACAS" => respondent[:acas_number],
            "respondent_name" => respondent[:name],
            "respondent_phone1" => secondary ? nil : respondent[:telephone_number],
            "respondent_address" => {
              "County" => respondent[:county],
              "PostCode" => respondent[:post_code],
              "PostTown" =>respondent[:locality],
              "AddressLine1" => respondent[:building],
              "AddressLine2" => respondent[:street],
              "Country" => nil
            },
            "respondent_ACAS_question"=>"Yes"
          }
        else
          {
            "respondent_name" => respondent[:name],
            "respondent_ACAS_question" => "No",
            "respondent_address" => 
              {
                "County" => respondent[:county],
                "PostCode" => respondent[:post_code],
                "PostTown" =>respondent[:locality],
                "AddressLine1" => respondent[:building],
                "AddressLine2" => respondent[:street],
                "Country" => nil
              },
            "respondent_phone1" => secondary ? nil : respondent[:telephone_number],
            "respondent_ACAS" => nil,
            "respondent_ACAS_no" => acas_exemption(respondent[:no_acas_number_reason].to_s.split(".").last)
          }
        end
      end

      def claimant_work_address(respondent)
        if respondent[:work_county] == nil
          {
            "claimant_work_address" => {
              "County" => respondent[:county],
              "PostCode" => respondent[:post_code],
              "PostTown" => respondent[:locality],
              "AddressLine1" => respondent[:building],
              "AddressLine2" => respondent[:street],
              "Country" => nil
            },
            "claimant_work_phone_number" => respondent[:telephone_number]
          }
        else
          {
            "claimant_work_address" => {
              "County" => respondent[:work_county],
              "PostCode" => respondent[:work_post_code],
              "PostTown" => respondent[:work_locality],
              "AddressLine1" => respondent[:work_building],
              "AddressLine2" => respondent[:work_street],
              "Country" => nil
            },
            "claimant_work_phone_number" => respondent[:work_telephone_number]
          }
        end
      end

      def claimant_other_type(employment, claimants)
        common = {
          "claimant_disabled" => t(claimants[0][:has_special_needs]),
          "claimant_employed_currently" => "Yes", 
          "claimant_occupation" => employment[:job_title],
          "claimant_employed_from" => Date.parse(employment[:start_date]).strftime("%Y-%m-%d")
        }

        if currently_employed?(employment)
          common.merge! \
            "claimant_employed_to" => nil,
            "claimant_employed_notice_period" => nil
        elsif working_noticed_period?(employment)
          common.merge! \
            "claimant_employed_to" => nil,
            "claimant_employed_notice_period" => Date.parse(employment[:notice_period_end_date]).strftime("%Y-%m-%d")
        else employment_terminated?(employment)
          common.merge! \
            "claimant_employed_to" => Date.parse(employment[:end_date]).strftime("%Y-%m-%d"),
            "claimant_employed_notice_period" => nil
        end

        if claimants[0][:has_special_needs].to_s.split(".").last == "yes"
          common["claimant_disabled_details"] = claimants[0][:special_needs]
        end
        
        common
      end

      def representative_claimant_type(representative)
        {
          "representative_dx" => representative[:dx_number],
          "name_of_organisation" => representative[:organisation_name],
          "name_of_representative" => representative[:name],
          "representative_occupation" => t(representative[:type]),
          "representative_phone_number" => representative[:telephone_number],
          "representative_email_address" => representative[:email_address],
          "representative_mobile_number" => representative[:alternative_telephone_number]
        }
      end

      def representative_address(representative)
        {
          "representative_address" => {
            "County" => representative[:county],
            "PostCode" => representative[:post_code],
            "PostTown" => representative[:locality],
            "AddressLine1" => representative[:building],
            "AddressLine2" => representative[:street],
            "Country" => nil
          }
        }
      end

      def claimant_type(claimant)
        {
          "claimant_phone_number" => claimant[:telephone_number],
          "claimant_mobile_number" => claimant[:alternative_telephone_number],
          "claimant_email_address" => claimant[:email_address],
          "claimant_contact_preference" => claimant[:correspondence].to_s.split(".").last.titleize
        } 
      end

      def claimant_type_address(claimant)
        {
          "claimant_addressUK" => {
            "County" => claimant[:county],
            "Country" => claimant[:country].to_s.split(".").last == "united_kingdom" ? "United Kingdom" : nil,
            "PostCode" => claimant[:post_code],
            "PostTown" => claimant[:locality],
            "AddressLine1" => claimant[:building],
            "AddressLine2" => claimant[:street]
            }
        }
      end

      private

      def working_noticed_period?(employment)
        employment[:notice_period_end_date] != ''
      end

      def currently_employed?(employment)
        employment[:notice_period_end_date] == '' && employment[:end_date] == ''
      end

      def employment_terminated?(employment)
        employment[:end_date] != ''
      end

      def acas_number?(respondent)
        respondent[:acas_number] != nil
      end

    end
  end
end