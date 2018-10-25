require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class LandingPage < BasePage
        include RSpec::Matchers
        set_url ::EtFullSystem::Test::Configuration.diversity_url

        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end

        section :main_content, '#content .container' do

          element :header, :main_header, 'diversity.header'

          section :content_section, '.main-section .main-content' do
            element :optional_text, :paragraph, 'diversity.index.optional_text'
            element :anonymous,:paragraph, 'diversity.index.anonymous'

            element :start_diversity, :link_named, 'diversity.index.begin_form'
          end
        end

        def start_diversity
          main_content.content_section.start_diversity.click
        end

        def has_correct_translation?
          expect(feedback_notice).to have_language

          expect(main_content).to have_header

          expect(main_content.content_section).to have_optional_text
          expect(main_content.content_section).to have_anonymous
          expect(main_content.content_section).to have_start_diversity
        end
      end
    end
  end
end