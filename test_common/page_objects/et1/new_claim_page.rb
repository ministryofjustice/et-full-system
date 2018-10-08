require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class NewClaimPage < BasePage
        include RSpec::Matchers
        set_url ::EtFullSystem::Test::Configuration.et1_url
        section :feedback_notice, '.feedback-notice' do
          element :language_picker, '.language-picker a'
          element :language, :link_named, 'switch.language'
          element :feedback_link, :paragraph_link_named, 'shared.feedback_link.feedback_statement_html'
        end
        element :header, :h1_text, 'claims.new.header', exact: false
        element :are_you_in_time_h2, :h2_text, 'claims.new.are_you_in_time.legend', exact: false
        element :are_you_in_time_body, :paragraph_link_named, 'claims.new.are_you_in_time.body_html', exact: false
        element :have_you_contacted_acas_h2, :h2_text, 'claims.new.have_you_contacted_acas.legend', exact: false
        element :have_you_contacted_acas_body, :paragraph_link_named, 'claims.new.have_you_contacted_acas.body_html', exact: false
        element :what_you_need_to_know_h2, :h2_text, 'claims.new.what_you_need_to_know.legend', exact: false
        element :what_you_need_to_know_acas_text, :paragraph_link_named, 'claims.new.what_you_need_to_know.body_html.acas_text', exact: false
        element :what_you_need_to_know_acas_details, :paragraph_link_named, 'claims.new.what_you_need_to_know.body_html.acas_details', exact: false
        element :start_a_claim_link, 'input[type="submit"]', exact: false
        element :start_a_claim_button, :submit_text, 'helpers.submit.claim.create', exact: false
        element :return_a_claim_button, :link_named, 'helpers.link.claim.return', exact: false
        def start_a_claim
          start_a_claim_link.click
        end

        def switch_language
          feedback_notice.language_picker.click
        end

        def has_correct_translation_feedback_notice?
          expect(feedback_notice.language.text).to be_truthy
          expect(feedback_notice.feedback_link.text).to be_truthy
        end

        def has_correct_translation_headertext?
          expect(header.text).to be_truthy
        end

        def has_correct_translation_are_you_in_time?
          expect(are_you_in_time_h2.text).to be_truthy
          expect(are_you_in_time_body.text).to be_truthy
        end

        def has_correct_translation_have_you_contacted_acas?
          expect(have_you_contacted_acas_h2.text).to be_truthy
          expect(have_you_contacted_acas_body.text).to be_truthy
        end

        def has_correct_translation_what_you_need_to_know?
          expect(what_you_need_to_know_h2.text).to be_truthy
          expect(what_you_need_to_know_acas_text.text).to be_truthy
          expect(what_you_need_to_know_acas_details.text).to be_truthy
        end

        def has_correct_translation_action_buttons_labelled?
          expect(start_a_claim_button.value).to be_truthy
          expect(return_a_claim_button.text).to be_truthy
        end
      end
    end
  end
end