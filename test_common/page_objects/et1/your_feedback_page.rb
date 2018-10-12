require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class YourFeedbackPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        section 'flash_heading', '#flash-summary' do
          element :flash_message, :content_header, 'feedback.create.sent'
        end
        #your feedback header
        element :header, :main_header, 'feedback.new.header'
        section :main_content, '.main-section, .main-content' do
          #have you had any problems using this service? (optional)
          section :comments, :question_labelled, 'simple_form.labels.feedback.comments', exact: false do
            element :field, :css, "textarea"
            delegate :set, to: :field
          end
          #do you have any other comments or suggestions? (optional)
          section :suggestions, :question_labelled, 'simple_form.labels.feedback.suggestions', exact: false do
            element :field, :css, "textarea"
            delegate :set, to: :field
          end
          #your email address (optional)
          section :email_address, :question_labelled, 'simple_form.labels.feedback.email_address', exact: false do
            element :field, :css, "input"
            delegate :set, to: :field
          end
        end
        #send feedback
        section :form_actions, '.form-actions' do
          element :submit_feedback, :submit_text, 'helpers.submit.feedback.create'
        end
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
        end

        def send_your_feedback
          form_actions.submit_feedback.click
        end
        
        def has_correct_translation?
          #your feedback header
          expect(header.text).to be_truthy
          #body text
          expect(main_content.comments.text).to be_truthy
          expect(main_content.suggestions.text).to be_truthy
          expect(main_content.email_address.text).to be_truthy
          #Support links
          expect(support.suport_header.text).to be_truthy
          expect(support.guide.text).to be_truthy
          expect(support.contact_use.text).to be_truthy
        end
      end
    end
  end
end