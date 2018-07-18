require 'httparty'

module EtFullSystem
  module Test
    class MailApi
      def url
        Configuration.mail_url
      end

      def claim_started_mail
        mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ['test@digital.justice.gov.uk'] && a['Content']['Headers']['Subject'] == ["Employment tribunal: claim submitted"]}
      end

      def check_mail_sent_for_claim
        mailhog_api['items'].select { |a| a['Content']['Headers']['To'] == ['test@digital.justice.gov.uk'] && a['Content']['Headers']['Subject'] == ["Employment tribunal: complete your claim"]}
      end

      private

      def mailhog_api
        HTTParty.get("http://localhost:32788//api/v2/messages")
      end
    end
  end
end
