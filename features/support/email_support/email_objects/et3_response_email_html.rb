require 'mail'
require_relative './base'
require_relative './office_helper'
require 'rack/utils'
module EtFullSystem
  module Test
    class Et3ResponseEmailHtml < SitePrism::Page
      include RSpec::Matchers
      include EtFullSystem::Test::OfficeHelper
      include EtFullSystem::Test::I18n

      def self.find(search_url: ::EtFullSystem::Test::Configuration.mailhog_search_url, reference:, locale:, sleep: 10, timeout: 120)
        instances = search_url.map { |mail| Et3ResponseEmailHtml.new(mail, locale: locale) }
        instances.detect { |instance| oinstance.has_correct_subject? && instance.has_reference_element?(reference) }
      end

      def initialize(mail, locale:)
        self.mail = mail
        self.locale = locale
        multipart = mail.parts.detect { |p| p.content_type =~ %r{multipart\/alternative} }
        part = multipart.parts.detect { |p| p.content_type =~ %r{text\/html} }
        body = part.nil? ? '' : part.body.to_s
        load(body)
      end

      def has_reference_element?(reference)
        assert_reference_element(reference)
        true
      rescue Capybara::ElementNotFound
        false
      end

      def has_correct_content_for?(input_data, reference:) # rubocop:disable Naming/PredicateName
        office = office_for(case_number: input_data.case_number)
        aggregate_failures 'validating content' do
          assert_reference_element(reference)
          expect(has_correct_subject?).to be true
          expect(has_correct_to_address_for?(input_data)).to be true
          assert_office_name_element(office.name)
          assert_office_address_element(office.address)
          assert_office_telephone_element(office.telephone)
          assert_submission_date
          expect(attached_pdf_for(reference: reference)).to be_present
        end
        true
      end

      def has_correct_subject? # rubocop:disable Naming/PredicateName
        mail.subject == t('response_email.subject', locale: locale)
      end

      private

      def has_correct_to_address_for?(input_data) # rubocop:disable Naming/PredicateName
        mail.to.include?(input_data.email_receipt)
      end

      def assert_reference_element(reference)
        assert_selector(:css, 'p', text: t('response_email.reference', locale: locale, reference: reference), wait: 0)
      end

      def assert_submission_date_element(submission_date)
        assert_selector(:css, 'p', text: t('response_email.submission_date', locale: locale, submission_date: submission_date))
      end

      def has_submission_date_element?(submission_date)
        assert_submission_date_element(submission_date)
        true
      rescue Capybara::ElementNotFound
        false
      end

      def assert_submission_date
        now = Time.zone.now

        return if has_submission_date_element?(now.strftime('%d/%m/%Y'))
        assert_submission_date_element((now - 1.minute).strftime('%d/%m/%Y'))
      end

      def assert_office_address_element(office_address)
        assert_selector(:css,'p', text: t('response_email.office_address', locale: locale, address: office_address), wait: 0)
      end

      def assert_office_telephone_element(telephone)
        assert_selector(:css, 'p', text: t('response_email.office_telephone', locale: locale, telephone: telephone), wait: 0)
      end

      def assert_office_name_element(office_name)
        assert_selector(:css, 'p', text: t('response_email.office_name', locale: locale, office_name: office_name), wait: 0)
      end

      def attached_pdf_for(reference:)
        mail.parts.attachments.detect { |a| a.filename == "#{reference}.pdf" }
      end

      attr_accessor :mail, :locale
    end
  end
end
