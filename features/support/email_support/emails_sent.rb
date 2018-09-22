module EtFullSystem
  module Test
    class EmailsSent
      def new_response_html_email_for(reference:)
        EtFullSystem::Test::EmailObjects::NewResponseEmailHtml.find(reference: reference)
      end

      def new_response_text_email_for(reference:)
        EtFullSystem::Test::EmailObjects::NewResponseEmailText.find(reference: reference)
      end
    end
  end
end
