require 'httparty'

module EtFullSystem
  module Test
    class MailApi
      include ::RSpec::Matchers
      def mailhog_api
        delete_mailhog_api
        response = HTTParty.get(::EtFullSystem::Test::Configuration.mailhog_url)
        response['items'][0]['Content']['Headers']
      end

      private

      def delete_mailhog_api
        HTTParty.delete(::EtFullSystem::Test::Configuration.mailhog_url)
      end
    end
  end
end
