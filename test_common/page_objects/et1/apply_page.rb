require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ApplyPage < BasePage
        include RSpec::Matchers
        set_url ::EtFullSystem::Test::Configuration.et1_url
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        element :header, :main_header, 'claims.new.header'
        #are you in time?
        element :are_you_in_time_header, :content_header, 'claims.new.are_you_in_time.legend'
        element :are_you_in_time_paragraph, :paragraph, 'claims.new.are_you_in_time.body_html', exact: false
        element :learn_how_to_apply_link, :link_named, 'claims.new.are_you_in_time.link', exact: false
        #have you contacted Acas?
        element :have_you_contacted_acas_header, :content_header, 'claims.new.have_you_contacted_acas.legend'
        element :have_you_contacted_acas_paragraph, :paragraph, 'claims.new.have_you_contacted_acas.body_html', exact: false
        element :early_coniciliation_service_link, :paragraph, 'claims.new.have_you_contacted_acas.link'
        element :what_you_need_to_know_header, :content_header, 'claims.new.what_you_need_to_know.legend'
        #what you'll need
        element :what_you_need_to_know_acas_text, :listing_containing_text, 'claims.new.what_you_need_to_know.body_html.acas_text', exact: false
        element :acas_certificate_number_link, :listing_containing_text, 'claims.new.what_you_need_to_know.body_html.link', exact: false
        element :what_you_need_to_know_acas_details, :listing_containing_text, 'claims.new.what_you_need_to_know.body_html.acas_details'
        #start a claim
        element :start_a_claim_button, :submit_text, 'helpers.submit.claim.create'
        #return to a claim
        element :return_a_claim_button, :link_named, 'helpers.link.claim.return'
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
        end
        
        def start_a_claim
          start_a_claim_button.click
        end

        def return_to_claim
          return_a_claim_button.click
        end

        def switch_to_welsh
          feedback_notice.welsh_link.click
        end

        def switch_to_english
          feedback_notice.english_link.click
        end

        def learn_how_to_apply
          learn_how_to_apply_link.click
        end

        def acas_certificate_number
          acas_certificate_number_link.click
        end

        def has_correct_translation?
          #your feedback header
          expect(feedback_notice.language.text).to be_truthy
          expect(feedback_notice.feedback_link.text).to be_truthy
          expect(header.text).to be_truthy
          #are you in time?
          expect(are_you_in_time_header.text).to be_truthy
          expect(are_you_in_time_paragraph.text).to be_truthy
           #have you contacted Acas?
          expect(have_you_contacted_acas_header.text).to be_truthy
          expect(have_you_contacted_acas_paragraph.text).to be_truthy
          #what you'll need
          expect(what_you_need_to_know_header.text).to be_truthy
          expect(what_you_need_to_know_acas_text.text).to be_truthy
          expect(what_you_need_to_know_acas_details.text).to be_truthy
          #start a claim and return to a cliam
          expect(start_a_claim_button.value).to be_truthy
          expect(return_a_claim_button.text).to be_truthy
          #Support links
          expect(support.suport_header.text).to be_truthy
          expect(support.guide.text).to be_truthy
          expect(support.contact_use.text).to be_truthy
        end
      end
    end
  end
end