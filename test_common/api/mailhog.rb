require 'httparty'
require 'mail'

module EtFullSystem
  module Test
    class MailApi
      include ::RSpec::Matchers
      def mailhog_api
        response = HTTParty.get(::EtFullSystem::Test::Configuration.mailhog_url)
        mail = Mail.new(response)
          # header = mail.mailhog_api['items'][0]['Content']['Headers']
         # body = mail.mailhog_api['items'][0]['Content']['Body']
      end
    end
  end
end
