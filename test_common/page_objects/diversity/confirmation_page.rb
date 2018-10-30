require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class ConfirmationPage < BasePage
        include RSpec::Matchers
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end
        section :main_content, '.container' do
          element :header, :main_header, 'confirmation.header'
          element :content, :paragraph, 'confirmation.content'
          element :return_button, :link_named, 'confirmation.button_text'
        end

        def return_to_gov_uk
          main_content.return_button.click
        end

        def has_correct_translation?
          expect(feedback_notice).to have_language
          expect(main_content).to have_header
          expect(main_content).to have_content
          expect(main_content).to have_return_button
        end
      end
    end
  end
end