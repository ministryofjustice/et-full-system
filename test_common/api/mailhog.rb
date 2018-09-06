require 'httparty'

module EtFullSystem
  module Test
    class MailApi
      def claim_submitted(email_address)
        mail = mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ["#{email_address}"] && a['Content']['Headers']['Subject'] == ["Employment tribunal: claim submitted"]}[0]
        mail['Content']['Headers']
      end

      def claim_started(email_address)
        mail = mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ["#{email_address}"] && a['Content']['Headers']['Subject'] == ["Employment tribunal: complete your claim"]}[0]
        mail['Content']['Headers']
      end

      def respondent_submitted(email_address)
        mail = mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ["#{email_address}"] && a['Content']['Headers']['Subject'] == ["Your Response to Employment Tribunal claim online form receipt"]}[0]
        mail['Content']['Headers']
      end

      private

      def mailhog_api
        delete_mailhog_api
        HTTParty.get(::EtFullSystem::Test::Configuration.mailhog_search_url)
      end

      def delete_mailhog_api
        HTTParty.delete(::EtFullSystem::Test::Configuration.mailhog_url)
      end
    end
  end
end


