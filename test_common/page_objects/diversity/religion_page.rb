require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class ReligionPage < BasePage
        include RSpec::Matchers
        set_url "#{::EtFullSystem::Test::Configuration.diversity_url}/religion"
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end
        section :main_content, '.container' do
          element :header, :main_header, 'religion.header'
          section :none, :form_labelled, 'religion.no-religion' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :christian, :form_labelled, 'religion.christian-including-church-of-england-catholic-protestant-and-all-other-christian-denominations' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :buddhist, :form_labelled, 'religion.buddhist' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :hindu, :form_labelled, 'religion.hindu' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :jewish, :form_labelled, 'religion.jewish' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :muslim, :form_labelled, 'religion.muslim' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :sikh, :form_labelled, 'religion.sikh' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :prefer_not_to_say, :form_labelled, 'religion.prefer_not_to_say' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :other_religion, :form_labelled, 'religion.any-other-religion' do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :describe_religion, :diversity_hidden_input, 'religion.describe_religion' do
            element :field, 'input'
            delegate :set, to: :field
          end
          element :save_and_continue_button, :diversity_input_button_named, 'religion.button_text'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(answers)
          data = answers.to_h
          if data[:religion] != nil
            if data[:religion] == "Jehovah's Witnesses"
              choose('Any other religion', name: 'diversities_religion[religion]')
              main_content.other_religion.set(data[:religion])
            else
             choose(data[:religion], name: 'diversities_religion[religion]')
            end
          end
          save_and_continue
        end

        def has_correct_translation?
          expect(feedback_notice).to have_language
          expect(main_content).to have_header
          expect(main_content).to have_none
          expect(main_content).to have_christian
          expect(main_content).to have_buddhist
          expect(main_content).to have_hindu
          expect(main_content).to have_jewish
          expect(main_content).to have_muslim
          expect(main_content).to have_sikh
          expect(main_content).to have_prefer_not_to_say
          expect(main_content).to have_other_religion
          expect(main_content).to have_describe_religion
        end

      end
    end
  end
end

