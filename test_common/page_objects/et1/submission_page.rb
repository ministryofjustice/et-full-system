require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class SubmissionPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #Check your claim
        section :main_header, '.main-header' do
          element :page_header, :main_header, 'claim_reviews.show.header', exact: false
        end
        section :main_content, '#content .main-section .main-content' do
          element :submit_claim_button, 'form.new_confirmation_email input[value="Submit claim"]'
        end

        def submit_claim
          main_content.submit_claim_button.click
        end
      end
    end
  end
end