module EtFullSystem
  module Test
    module Et3Export
      # Returns a huge array of matchers to validate what an ET3 response txt file should look like
      #
      # @param [HashWithIndifferentAccess] user The user from the personas
      #
      # @return [Array<String,RSpec::Matchers::BuiltIn::BaseMatcher>] An array of simple strings and rspec matchers for use
      #  as one huge expectation based on the input user.
      def calculated_response_matchers(user:)
        [
          'ET3 - Response to an Employment Tribunal claim',
          '',
          'For Office Use',
          '',
          starting_with('Received at ET: ').and(ending_with(Date.today.strftime("%d/%m/%Y"))),
          starting_with('Case Number: ').and(ending_with(user[:case_number])),
          'Code:',
          'Initials:',
          '',
          match(/\AOnline Submission Reference: \d{10}00\z/),
          '',
          'FormVersion: 2',
          '',
          '## Intro: ',
          '',
          starting_with('**In the claim of: ').and(ending_with(user[:claimants_name])),
          starting_with('**Case number: ').and(ending_with(user[:case_number])),
          starting_with('**Tribunal office: ').and(ending_with('@hmcts.gsi.gov.uk')),
          '',
          "## Section 1: Claimant's name",
          '',
          starting_with("~1.1 Claimant's name: ").and(ending_with(user[:claimants_name])),
          '',
          "## Section 2: Your organisation's details",
          '',
          starting_with('~2.1 Name of your organisation: ').and(ending_with(user[:name])),
          "Contact name: #{user[:contact]}",
          "~2.2 Address",
          "Address 1: #{user[:building_name]}",
          "Address 2: #{user[:street_name]}",
          "Address 3: #{user[:town]}",
          "Address 4: #{user[:county]}",
          "Postcode: #{user[:postcode]}",
          "~2.3 Phone number: #{user[:contact_number]}",
          "Mobile number: #{user[:contact_mobile_number]}",
          "~2.4 How would you prefer us to communicate with you?: #{user[:contact_preference]}",
          "E-mail address: #{user[:email_address]}",
          '',
          "## Section 7: Your representative",
          '',
          "~7.1 Representative's name: #{user[:representative_name]}",
          "~7.2 Name of the representative's organisation: #{user[:representative_org_name]}",
          "Representative's Address 1: #{user[:representative_building]}",
          "Representative's Address 2: #{user[:representative_street]}",
          "Representative's Address 3: #{user[:representative_town]}",
          "Representative's Address 4: #{user[:representative_county]}",
          "Representative's Postcode: #{user[:representative_postcode]}",
          "~7.4 Representative's Phone number: #{user[:representative_phone]}",
          "~7.5 Representative's Reference: #{user[:representative_reference]}",
          "~7.6 How would they prefer us to communicate with them?: #{user[:representative_contact_preference].downcase}",
          "Representative's E-mail address: #{user[:representative_email]}",
          '',
          '**Version: Jadu 1.0',
          ''
        ]
      end
    end
  end
end
