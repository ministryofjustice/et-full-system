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
          "feeGroupReference" => data
        }
      end

      def ccd_claimant_details(data)
        et1_online_data = json_object(data)
          {
            "claimant_title1" => et1_online_data[:title],
            "claimant_first_names" => et1_online_data[:first_name],
            "claimant_last_name" => et1_online_data[:last_name],
            "claimant_date_of_birth" => et1_online_data[:date_of_birth],
            "claimant_gender" => et1_online_data[:gender],
            "claimant_disabled" => et1_online_data[:has_special_needs],
            "claimant_disabled_details" => et1_online_data[:special_needs],
            "AddressLine1" => et1_online_data[:building],
            "AddressLine2" => et1_online_data[:street],
            "PostTown" => et1_online_data[:locality],
            "County" => et1_online_data[:county],
            "PostCode" => et1_online_data[:post_code],
            "Country" => et1_online_data[:country],
            "claimant_phone_number" => et1_online_data[:telephone_number],
            "claimant_mobile_number" => et1_online_data[:alternative_telephone_number],
            "claimant_email_address" => et1_online_data[:email_address],
            "claimant_contact_preference" => et1_online_data[:correspondence]
          }
      end
    end
  end
end