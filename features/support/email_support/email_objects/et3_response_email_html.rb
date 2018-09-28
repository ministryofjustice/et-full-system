require 'mail'
require_relative './base'
require 'rack/utils'
module EtFullSystem
  module Test
    class Et3ResponseEmailHtml < SitePrism::Page
      include RSpec::Matchers
      element(:reference_element, :xpath, XPath.generate { |x| x.descendant(:p)[x.string.n.starts_with('This is your reference number:')] })
      element(:submission_date_element, :xpath, XPath.generate { |x| x.descendant(:p)[x.string.n.starts_with('Submission date:')] })
      element(:office_address_element, :xpath, XPath.generate { |x| x.descendant(:p)[x.string.n.starts_with('Office address:')] })
      element(:office_telephone_element, :xpath, XPath.generate { |x| x.descendant(:p)[x.string.n.starts_with('Telephone:')] })
      element(:office_name_element, :xpath, XPath.generate { |x| x.descendant(:p)[x.string.n.starts_with('Thank you for your submission. It has been forwarded to the')] })

      def self.find(search_url: ::EtFullSystem::Test::Configuration.mailhog_search_url, reference:, sleep: 30, timeout: 120)
        item = find_email(reference, search_url, sleep: sleep, timeout: timeout)
        raise "ET3 Mail with reference #{reference} not found" unless item.present?
        new(item)
      end

      def self.find_email(reference, search_url, timeout: 120, sleep: 10)
        Timeout.timeout(timeout) do
          item = nil
          until item.present? do
            query = Rack::Utils.build_query(kind: 'containing', query: reference, start: 0, limit: 1)
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
      def reference
        reference_element.text.split(':').last.strip.tr(' which should be quoted on all correspondence.', '')
      end

      def submission_date
        submission_date_element.text.gsub(/\A.*?:/, '').strip
      end

      def has_correct_subject? # rubocop:disable Naming/PredicateName
        mail.subject == 'Your Response to Employment Tribunal claim online form receipt'
      end

      attr_accessor :mail
    end
  end
end
