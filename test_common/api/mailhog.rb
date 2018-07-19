require 'httparty'

module EtFullSystem
  module Test
    class MailApi
      def claim_submitted_email(email_address)
        mail = mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ["#{email_address}"] && a['Content']['Headers']['Subject'] == ["Employment tribunal: claim submitted"]}[0]
        binding.pry
        return mail['Content']['Headers']
      end

      def claim_started_email(email_address)
        mail = mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ["#{email_address}"] && a['Content']['Headers']['Subject'] == ["Employment tribunal: complete your claim"]}[0]
        mail['Content']['Headers']
      end

      private

      def mailhog_api
        HTTParty.get(::EtFullSystem::Test::Configuration.mailhog_url)
      end
    end
  end
end
