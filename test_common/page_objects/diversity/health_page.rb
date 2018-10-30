require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class HealthPage < BasePage
        include RSpec::Matchers
        set_url "#{::EtFullSystem::Test::Configuration.diversity_url}/disability"

        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end

        section :main_content, '.container' do
          element :header, :main_header, 'health.header', exact: false

          element :definition, :paragraph, 'health.definition'
          element :example, :paragraph, 'health.example'

          section :yes, :form_labelled, 'health.yes_answer'do
            element :field, 'input'

            delegate :set, to: :field
          end

          section :no, :form_labelled, 'health.no_answer'do
            element :field, 'input'

            delegate :set, to: :field
          end

          section :prefer_not_to_say, :form_labelled, 'health.prefer_not_to_say'do
            element :field, 'input'

            delegate :set, to: :field
          end

          element :save_and_continue_button, 'input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(answers)
          data = answers.to_h
          if data[:disability] != nil
            choose(data[:disability], name: 'diversities_disability[disability]')
          end
          save_and_continue
        end

        def has_correct_translation?
          expect(feedback_notice).to have_language

          expect(main_content).to have_header
          expect(main_content).to have_definition
          expect(main_content).to have_example

          expect(main_content).to have_yes
          expect(main_content).to have_no
          expect(main_content).to have_prefer_not_to_say
        end
      end
    end
  end
end