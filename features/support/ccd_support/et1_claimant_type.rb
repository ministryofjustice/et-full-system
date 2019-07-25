module EtFullSystem
  module Test
    module Et1ClaimantType
      def claimant_ind_type(claimant, secondary: false)
          gender = claimant[:gender].to_s.split(".").last == "prefer_not_to_say" ? "Not Known" : t(claimant[:gender])
          {
            "claimant_title1" => t(claimant[:title]), 
            "claimant_first_names" => claimant[:first_name], 
            "claimant_last_name" => claimant[:last_name], 
            "claimant_date_of_birth" => Date.parse(claimant[:date_of_birth]).strftime("%Y-%m-%d"),
            "claimant_gender" => secondary ? nil : gender
          }
      end

      def respondent_sum_type(respondent)
        common = {
          "respondent_ACAS" => respondent[:acas_number],
          "respondent_name" => respondent[:name],
          "respondent_phone1" => respondent[:telephone_number],
          "respondent_ACAS_question" => respondent[:acas_number].present? ? "Yes" : "No",
          "respondent_address" => {
            "County" => respondent[:county],
            "PostCode" => respondent[:post_code],
            "PostTown" =>respondent[:locality],
            "AddressLine1" => respondent[:building],
            "AddressLine2" => respondent[:street],
            "Country" => nil
          }
        }
        if respondent[:acas_number].nil?
          common.merge! "respondent_ACAS_no" => acas_exemption(respondent[:no_acas_number_reason].to_s.split(".").last)
        end
        common
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

      def claimant_other_type(employment, claimant)
        common = {
          "claimant_disabled" => t(claimant[0][:has_special_needs]),
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

        if claimant[0][:has_special_needs].to_s.split(".").last == "yes"
          common["claimant_disabled_details"] = claimant[0][:special_needs]
        end
        
        common
      end

      def secondary_employment(employment, claimant)
        if employment[:employment_details] == :"claims.employment.no"
          {
            "claimant_disabled" => t(claimant[0][:has_special_needs]), 
            "claimant_disabled_details" => claimant[0][:special_needs]
          }
        else
          claimant_other_type(employment, claimant)
        end
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

      def no_representative
        {
          "claimantRepresentedQuestion" => "No"
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

      def secondary_representative(representative)
        if representative['representative_have'] == 'No'
          no_representative
        else
          representative_address(representative).merge(representative_claimant_type(representative))
        end
      end

      def claimant_type(claimant, secondary: false)
        {
          "claimant_phone_number" => secondary ? nil : claimant[:telephone_number],
          "claimant_mobile_number" => secondary ? nil : claimant[:alternative_telephone_number],
          "claimant_email_address" => secondary ? nil : claimant[:email_address],
          "claimant_contact_preference" => secondary ? nil : claimant[:correspondence].to_s.split(".").last.titleize
        } 
      end

      def claimant_type_address(claimant, secondary: false)
        {
          "claimant_addressUK" => {
            "County" => claimant[:county],
            "Country" => secondary ? nil : claimant[:country].to_s.split(".").last == "united_kingdom" ? "United Kingdom" : nil,
            "PostCode" => claimant[:post_code],
            "PostTown" => claimant[:locality],
            "AddressLine1" => claimant[:building],
            "AddressLine2" => claimant[:street]
            }
        }
      end

      def secondary_claimant_type_address(claimant, secondary: true)
        claimant_type_address(claimant, secondary: true).merge(claimant_type(claimant, secondary: true))
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
    end
  end
end