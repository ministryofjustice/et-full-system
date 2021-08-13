require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class YourFeedbackPage < BasePage
        include RSpec::Matchers
        section :flash_heading, '#flash-summary' do
          element :flash_message, '#flash-heading'
        end
        #your feedback header
        element :header, :main_header, 'feedback.new.header'
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          #have you had any problems using this service? (optional)
          gds_text_area :comments, :'simple_form.labels.feedback.comments'
          #do you have any other comments or suggestions? (optional)
          gds_text_area :suggestions, :'simple_form.labels.feedback.suggestions'
          #your email address (optional)
          gds_text_input :email_address, :'simple_form.labels.feedback.email_address'
        end
        #send feedback
        section :form_actions, '.form-actions' do
          include EtTestHelpers::Section
          gds_submit_button :submit_feedback, :'helpers.submit.feedback.create'
        end
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
        end

        expected_elements :header, :main_content, :form_actions, :support

        def send_your_feedback
          form_actions.submit_feedback.click
        end

        def switch_to_welsh
          feedback_notice.welsh_link.click
        end

        def switch_to_english
          feedback_notice.english_link.click
        end
        
        def has_correct_translation?
          #your feedback header
          expect(self).to have_header
          #body text
          expect(main_content).to have_comments
          expect(main_content).to have_suggestions
          expect(main_content).to have_email_address
          #Support links
          expect(support).to have_suport_header
          expect(support).to have_guide
          expect(support).to have_contact_use
        end
      end
    end
  end
end
