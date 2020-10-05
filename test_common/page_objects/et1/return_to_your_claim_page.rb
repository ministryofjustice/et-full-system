require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ReturnToYourClaimPage < BasePage
        include RSpec::Matchers
        #page title
        element :header, :main_header, 'user_sessions.new.header'
        section :main_content, '.container .main-section .main-content' do
          #return to your claim
          element :sub_header, :legend_header, 'user_sessions.new.subheader'
          #claim number
          element :claim_number_label, :form_labelled, 'simple_form.labels.user_session.new.reference'
          element :claim_number_hint, :paragraph, 'simple_form.hints.user_session.new.reference'
          element :claim_number, 'input#user_reference'
          #memorable word
          element :memorable_word_label, :form_labelled, 'simple_form.labels.user_session.new.password'
          element :memorable_word_hint, :paragraph, 'simple_form.hints.user_session.new.password'
          element :memorable_word, 'input#user_password'
          #find my claim
          element :find_my_claim, :submit_text, 'helpers.submit.user_session.create'
          #don't have these details
          element :form_hint, :paragraph, 'user_sessions.new.hint_html', exact: false
          element :new_claim, :link_named, 'user_sessions.new.link'
          element :reset_memorable_word_element, :link_named, 'helpers.link.user_session.reset_memorable_word'
        end
        section :flash_heading, '#flash-summary' do
          element :memorable_word_email_sent_flash_element, :content_header, 'simple_form.labels.user_session.memorable_word.email_sent_flash_text'
          element :memorable_word_updated_flash_element, :content_header, 'simple_form.labels.user_session.memorable_word.updated_flash_text'
          element :invalid,:content_header, 'user_sessions.new.invalid'
        end

        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
        end

        def find_my_claim
          main_content.find_my_claim.click
        end

        def switch_to_welsh
          feedback_notice.welsh_link.click
        end

        def switch_to_english
          feedback_notice.english_link.click
        end
        
        def start_a_new_claim
          main_content.new_claim.click
        end

        def reset_memorable_word
          main_content.reset_memorable_word_element.click
          ResetMemorableWordEmailInstructionsPage.new
        end

        def assert_memorable_word_email_sent
          flash_heading.memorable_word_email_sent_flash_element
          self
        end

        def assert_memorable_word_updated
          flash_heading.memorable_word_updated_flash_element
          self
        end

        def memorable_word_valid?
          expect(flash_heading).to have_invalid
        end

        def has_correct_translation?
          #header
          expect(self).to have_header
          expect(main_content).to have_sub_header
          #enter your details below
          expect(main_content).to have_claim_number_label
          expect(main_content).to have_claim_number_hint
          expect(main_content).to have_memorable_word_label
          #find my claim
          expect(main_content).to have_find_my_claim
          #don't have these details
          expect(main_content).to have_form_hint
        end

        def set(user)
          data = user[0].to_h
          main_content.tap do |s|
            set_field(s, :claim_number, data)
            set_field(s, :memorable_word, data)
          end
        end

        def set_user(user)
          data = user[0].to_h
          main_content.tap do |s|
            set_field(s, :claim_number, data)
          end
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end
