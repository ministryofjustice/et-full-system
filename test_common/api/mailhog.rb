require 'httparty'

module EtFullSystem
  module Test
    class MailApi
      def claim_submitted_email(email_address)
        mail = mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ["#{email_address}"] && a['Content']['Headers']['Subject'] == ["Employment tribunal: claim submitted"]}[0]
        mail['Content']['Headers']
      end

      def claim_started_email(email_address)
        binding.pry
        mail = mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ["#{email_address}"] && a['Content']['Headers']['Subject'] == ["Employment tribunal: complete your claim"]}[0]
        mail['Content']['Headers']
      end

      def respondent_submitted_email(email_address)
        mail = mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ["#{email_address}"] && a['Content']['Headers']['Subject'] == ["Your Response to Employment Tribunal claim online form receipt"]}[0]
        mail['Content']['Headers']
      end

      private

      def mailhog_api
        HTTParty.get(::EtFullSystem::Test::Configuration.mailhog_url)
      end
    end
  end
end


