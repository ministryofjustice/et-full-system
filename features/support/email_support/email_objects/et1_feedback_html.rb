require 'mail'
require_relative './base'
require 'rack/utils'
module EtFullSystem
  module Test
    class Et1FeedbackHtml < SitePrism::Page
      include RSpec::Matchers
      include ::EtFullSystem::Test::I18n
    
      def self.find(search_url: ::EtFullSystem::Test::Configuration.mailhog_search_url, email_address:, sleep: 10, timeout: 50)
        item = find_email(email_address, search_url, sleep: sleep, timeout: timeout)
        raise "ET1 Feedback  #{email_address} not found" unless item.present?
        new(item)
      end

      def self.find_email(email_address, search_url, timeout: 50, sleep: 10, subject_text: 'New ATET User Feedback')
        Timeout.timeout(timeout) do
          item = nil
          until item.present? do
            query = Rack::Utils.build_query(kind: 'containing', query: email_address, start: 0, limit: 10)
            url = URI.parse(search_url)
            url.query = query
            response = HTTParty.get(url, headers: { accept: 'application/json' })
            item = response.parsed_response['items'].detect {|i| i.dig('Content', 'Headers', 'Subject').try(:first) == subject_text}
            sleep sleep unless item.present?
          end
          Mail.new item.dig('Raw', 'Data')
        end
      rescue Timeout::Error
        return nil
      end

      def initialize(mail)
        self.mail = mail
        part = mail.part.detect { |p| p.content_type =~ %r{text\/html} }
        body = part.nil? ? '' : part.body.to_s
        load(body)
      end

      def has_correct_email_address?(email_address)
        mail.from.first == email_address
      end

      def has_correct_subject_for_feedback_submitted?
        mail.subject == 'New ATET User Feedback'
      end

      attr_accessor :mail
    end
  end
end
