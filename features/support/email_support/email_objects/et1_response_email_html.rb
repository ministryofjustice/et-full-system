require_relative './base'
require 'rack/utils'
module EtFullSystem
  module Test
    class Et1ResponseEmailHtml < SitePrism::Page
      include RSpec::Matchers
      element(:claim_number_element, :xpath, XPath.generate { |x| x.descendant(:p)[x.string.n.starts_with('Claim number')] })
      element(:claim_submitted_element, :xpath, XPath.generate { |x| x.descendant(:p)[x.string.n.starts_with('Claim submitted:')] })
    
      def self.find(search_url: ::EtFullSystem::Test::Configuration.mailhog_search_url, claim_number:, sleep: 30, timeout: 120)
        item = find_email(claim_number, search_url, sleep: sleep, timeout: timeout)
        raise "ET1 Mail with claim number #{claim_number} not found" unless item.present?
        Et1ResponseEmailHtml.new(item)
      end

      def self.find_email(claim_number, search_url, timeout: 120, sleep: 10)
        Timeout.timeout(timeout) do
          item = nil
          until item.present? do
            query = Rack::Utils.build_query(kind: 'containing', query: claim_number, start: 0, limit: 1)
            url = URI.parse(search_url)
            url.query = query
            response = HTTParty.get(url, headers: { accept: 'application/json' })
            item = response.parsed_response['items'].first
            sleep sleep unless item.present?
          end
          Mail.new item.dig('Raw', 'Data')
        end
      rescue Timeout::Error
        return nil
      end

      def initialize(mail)
        self.mail = mail
        multipart = mail.parts.detect { |p| p.content_type =~ %r{multipart\/alternative} }
        part = multipart.parts.detect { |p| p.content_type =~ %r{text\/html} }
        body = part.nil? ? '' : part.body.to_s
        load(body)
      end

      # The reference number coming from inside the email
      def claim_number
        claim_number_element.text
      end

      def submission_submitted
        claim_submitted_element.text.gsub(/\A.*?:/, '').strip
      end

      def has_correct_subject_for_complete_your_claim? # rubocop:disable Naming/PredicateName
        mail.subject == 'Employment tribunal: complete your claim'
      end

      def has_correct_subject_for_claim_submitted? # rubocop:disable Naming/PredicateName
        mail.subject == 'Employment tribunal: claim submitted'
      end

      attr_accessor :mail
    end
  end
end
