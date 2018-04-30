module EtFullSystem
  module Test
    module Et1Export
      # Returns a huge array of matchera to validate what an ET1 claim txt file should look like
      #
      # @param [HashWithIndifferentAccess] user The user from the personas
      #
      # @return [Array<String,RSpec::Matchers::BuiltIn::BaseMatcher>] An array of simple strings and rspec matchers for use
      #  as one huge expectation based on the input user.
      def calculated_claim_matchers(user:)
        [
          'ET1 - Online Application to an Employment Tribunal',
          '',
          'For Office Use',
          '',
          starting_with('Received at ET: ').and(ending_with(Date.today.strftime("%d/%m/%Y"))),
          'Case Number:',
          'Code:',
          'Initials:',
          '',
          match(/\AOnline Submission Reference: \d{12}\z/),
          '',
          'FormVersion: 2',
          '',
          "~1.1 Title: #{user.dig(:personal, :title)}",
          'Title (other):',
          "~1.2 First Names: #{user.dig(:personal, :first_name)}",
          "~1.3 Surname: #{user.dig(:personal, :last_name)}",
          "~1.4 Date of Birth: #{user.dig(:personal, :date_of_birth)}",
          "You are: #{user.dig(:personal, :gender)}",
          '~1.5 Address:',
          "Address 1: #{user.dig(:personal, :building)}",
          "Address 2: #{user.dig(:personal, :street)}",
          "Address 3: #{user.dig(:personal, :locality)}",
          "Address 4: #{user.dig(:personal, :county)}",
          "Postcode: #{user.dig(:personal, :post_code)}",
          "~1.6 Phone number: #{user.dig(:personal, :telephone_number)}",
          "Mobile number: #{user.dig(:personal, :alternative_telephone_number)}",
          "~1.7 How would you prefer us to communicate with you?: #{user.dig(:personal, :correspondence)}",
          "E-mail address: #{user.dig(:personal, :email_address)}",
          '',
          "## Section 2: Respondent's details",
          '',
          '~2.1 Give the name of your employer or the organisation or person you are complaining about (the respondent):',
          "Respondent name: #{user[:respondents].first[:name]}",
          '~2.2 Address:',
          "Respondent Address 1: #{user[:respondents].first[:building]}",
          "Respondent Address 2: #{user[:respondents].first[:street]}",
          "Respondent Address 3: #{user[:respondents].first[:locality]}",
          "Respondent Address 4: #{user[:respondents].first[:county]}",
          "Respondent Postcode: #{user[:respondents].first[:post_code]}",
          "Respondent Phone: #{user[:respondents].first[:telephone_number]}",
          "~2.3 If you worked at an address different from the one you have given at 2.2, please give the full address:",
          "Alternative Respondent Address1: #{user[:respondents].first.dig(:work_address, :building)}",
          "Alternative Respondent Address2: #{user[:respondents].first.dig(:work_address, :street)}",
          "Alternative Respondent Address3: #{user[:respondents].first.dig(:work_address, :locality)}",
          "Alternative Respondent Address4: #{user[:respondents].first.dig(:work_address, :county)}",
          "Alternative Postcode: #{user[:respondents].first.dig(:work_address, :post_code)}",
          "Alternative Phone: #{user[:respondents].first.dig(:work_address, :telephone_number)}",
          '',
          '## Section 8: Your representative',
          '',
          "~8.1 Representative's name: #{user.dig(:representative, :name)}",
          "~8.2 Name of the representative's organisation: #{user.dig(:representative, :organisation_name)}",
          '~8.3 Address:',
          "Representative's Address 1: #{user.dig(:representative, :building)}",
          "Representative's Address 2: #{user.dig(:representative, :street)}",
          "Representative's Address 3: #{user.dig(:representative, :locality)}",
          "Representative's Address 4: #{user.dig(:representative, :county)}",
          "Representative's Postcode: #{user.dig(:representative, :post_code)}",
          "~8.4 Representative's Phone number: #{user.dig(:representative, :telephone_number)}",
          "Representative's Mobile number: #{user.dig(:representative, :alternative_telephone_number)}",
          "~8.5 Representative's Reference: #{user.dig(:representative, :dx_number)}",
          "~8.6 How would they prefer us to communicate with them?:",
          "Representative's E-mail address: #{user.dig(:representative, :email_address)}",
          "~8.7 Representative's Occupation: Solicitor",
          '',
          '## Section 10: Multiple cases',
          '',
          '~10.2 ET1a Submitted: ',
          '',
          '## Section 11: Details of Additional Respondents',
          '',
          "Name of your employer of the organisation you are claiming against1: #{user[:respondents][1].try(:dig, :name)}",
          'Address:',
          "AdditionalAddress1 1: #{user[:respondents][1].try(:dig, :building)}",
          "AdditionalAddress1 2: #{user[:respondents][1].try(:dig, :street)}",
          "AdditionalAddress1 3: #{user[:respondents][1].try(:dig, :locality)}",
          "AdditionalAddress1 4: #{user[:respondents][1].try(:dig, :county)}",
          "AdditionalPostcode1: #{user[:respondents][1].try(:dig, :post_code)}",
          "AdditionalPhoneNumber1: #{user[:respondents][1].try(:dig, :telephone_number)}",
          "Name of your employer of the organisation you are claiming against2: #{user[:respondents][2].try(:dig, :name)}",
          "Address:",
          "AdditionalAddress2 1: #{user[:respondents][2].try(:dig, :building)}",
          "AdditionalAddress2 2: #{user[:respondents][2].try(:dig, :street)}",
          "AdditionalAddress2 3: #{user[:respondents][2].try(:dig, :locality)}",
          "AdditionalAddress2 4: #{user[:respondents][2].try(:dig, :county)}",
          "AdditionalPostcode2: #{user[:respondents][2].try(:dig, :post_code)}",
          "AdditionalPhoneNumber2: #{user[:respondents][2].try(:dig, :telephone_number)}",
          "Name of your employer of the organisation you are claiming against3: #{user[:respondents][3].try(:dig, :name)}",
          "Address:",
          "AdditionalAddress3 1: #{user[:respondents][3].try(:dig, :building)}",
          "AdditionalAddress3 2: #{user[:respondents][3].try(:dig, :street)}",
          "AdditionalAddress3 3: #{user[:respondents][3].try(:dig, :locality)}",
          "AdditionalAddress3 4: #{user[:respondents][3].try(:dig, :county)}",
          "AdditionalPostcode3: #{user[:respondents][3].try(:dig, :post_code)}",
          "AdditionalPhoneNumber3: #{user[:respondents][3].try(:dig, :telephone_number)}"
        ]
      end

      # Returns a huge matcher to validate what an ET1a (the a meaning additional claimants) txt file should look like
      # @param [HashWithIndifferentAccess] user The user from the personas
      #
      # @return [Array<String,RSpec::Matchers::BuiltIn::BaseMatcher>] An array of simple strings and rspec matchers for use
      #  as one huge expectation based on the input user.
      def calculated_et1a_claim_matchers(user:)
        matchers = [
          'ET1a - Online Application to an Employment Tribunal',
          '',
          'For Office Use',
          '',
          "Received at ET: #{Date.today.strftime('%d/%m/%Y')}",
          'Case Number:',
          'Code:',
          'Initials:',
          '',
          match(/\AOnline Submission Reference: (?:\d{12})\z/),
          '',
          'FormVersion: 2',
          '',
          "The following claimants are represented by  (if applicable) and the relevant required information for all the additional claimants is the same as stated in the main claim of #{user.dig(:personal,:first_name)} #{user.dig(:personal, :last_name)} v #{user[:respondents].first[:name]}",
          '',
          ''

        ]
        group_claimants_for(user: user).each do |claimant|
          matchers.concat [
            '## Section et1a: claim',
            '',
            "~1.1 Title: #{claimant[:title]}",
            "~1.2 First Names: #{claimant[:first_name].downcase}",
            "~1.3 Surname: #{claimant[:last_name].downcase}",
            "~1.4 Date of Birth: #{claimant[:date_of_birth]}",
            '~1.5 Address:',
            "Address 1: #{claimant[:building].downcase}",
            "Address 2: #{claimant[:street].downcase}",
            "Address 3: #{claimant[:locality].downcase}",
            "Address 4: #{claimant[:county].downcase}",
            "Postcode: #{claimant[:post_code].downcase}",
            '',
            '',
            ''
          ]
        end
        matchers
      end

      private

      def group_claimants_for(user:)
        return user.dig(:personal, :group_claims) if user.dig(:personal, :group_claims).is_a?(Array)
        return [] unless user.dig(:personal, :group_claims_csv).is_a?(String)
        full_path = File.absolute_path(File.join('..', 'fixtures', user.dig(:personal, :group_claims_csv)), __dir__)
        raise "#{full_path} does not exist" unless File.exist?(full_path)
        results = CSV.read(full_path, headers: true)
        results.map do |row|
          {
            title: row['Title'],
            first_name: row['First name'],
            last_name: row['Last name'],
            date_of_birth: row['Date of birth'],
            building: row['Building number or name'],
            street: row['Street'],
            locality: row['Town/city'],
            county: row['County'],
            post_code: row['Postcode']
          }
        end
      end
    end
  end
end
