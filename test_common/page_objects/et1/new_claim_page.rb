require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class NewClaimPage < BasePage
        include RSpec::Matchers
        include ::EtFullSystem::Test::I18n
        set_url ::EtFullSystem::Test::Configuration.et1_url
        section :feedback_notice, '.feedback-notice' do
          element :language_picker, '.language-picker a'
          element :language, :link_named, 'switch.language'
          element :feedback_link, :paragraph_containing_text, 'shared.feedback_link.feedback_statement_html'
        end
        element :header, :main_header, 'claims.new.header', exact: false
        element :are_you_in_time_header, :content_header, 'claims.new.are_you_in_time.legend', exact: false
        element :are_you_in_time_paragraph, :paragraph_containing_text, 'claims.new.are_you_in_time.body_html', exact: false
        element :have_you_contacted_acas_header, :content_header, 'claims.new.have_you_contacted_acas.legend', exact: false
        element :have_you_contacted_acas_paragraph, :paragraph_containing_text, 'claims.new.have_you_contacted_acas.body_html', exact: false
        element :what_you_need_to_know_header, :content_header, 'claims.new.what_you_need_to_know.legend', exact: false
        element :what_you_need_to_know_acas_text, :listing_containing_text, 'claims.new.what_you_need_to_know.body_html.acas_text', exact: false
        element :what_you_need_to_know_acas_details, :listing_containing_text, 'claims.new.what_you_need_to_know.body_html.acas_details', exact: false
        element :start_a_claim_link, 'input[type="submit"]', exact: false
        element :start_a_claim_button, :submit_text, 'helpers.submit.claim.create', exact: false
        element :return_a_claim_button, :link_named, 'helpers.link.claim.return', exact: false
        element :suport_header, :main_header, 'shared.aside.gethelp_header'
        element :guide, :link_named, 'shared.aside.read_guide'
        element :contact_use, :link_named, 'shared.aside.contact_us'
        def start_a_claim
          start_a_claim_link.click
        end

        def switch_language
          feedback_notice.language_picker.click
        end

        def has_correct_translation?
          expect(feedback_notice.language.text).to be_truthy
          expect(feedback_notice.feedback_link.text).to be_truthy
          expect(header.text).to be_truthy
          expect(are_you_in_time_header.text).to be_truthy
          expect(are_you_in_time_paragraph.text).to be_truthy
          expect(have_you_contacted_acas_header.text).to be_truthy
          expect(have_you_contacted_acas_paragraph.text).to be_truthy
          expect(what_you_need_to_know_header.text).to be_truthy
          expect(what_you_need_to_know_acas_text.text).to be_truthy
          expect(what_you_need_to_know_acas_details.text).to be_truthy
          expect(start_a_claim_button.value).to be_truthy
          expect(return_a_claim_button.text).to be_truthy
          expect(start_a_claim_button.value).to be_truthy
          expect(return_a_claim_button.text).to be_truthy
        end

        def has_load_your_feedback_page
          # TODO - Need to validate in different langugages
          # expect(current_url).to eq("#{::EtFullSystem::Test::Configuration.et1_url}apply/feedback?locale=en")
        end
      end
    end
  end
end