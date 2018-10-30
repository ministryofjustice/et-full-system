require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class RelationshipStatusPage < BasePage
        include RSpec::Matchers
        set_url "#{::EtFullSystem::Test::Configuration.diversity_url}/relationship"
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end
        section :main_content, '.container' do
          element :header, :main_header, 'relationship.header'
          section :single, :form_labelled, 'relationship.single-that-is-never-married-and-never-registered-in-a-same-sex-civil-partnership'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :married, :form_labelled, 'relationship.married'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :separated, :form_labelled, 'relationship.separated-but-still-legally-married'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :divorced, :form_labelled, 'relationship.divorced'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :widowed, :form_labelled, 'relationship.widowed'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :registered_same_sex_civil_partnership, :form_labelled, 'relationship.in-a-registered-same-sex-civil-partnership'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :separated_same_sex_civil_partnership, :form_labelled, 'relationship.separated-but-still-legally-in-a-same-sex-civil-partnership'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :dissolved_same_sex_civil_partnership, :form_labelled, 'relationship.formerly-in-a-same-sex-civil-partnership-which-is-now-legally-dissolved'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :surviving_partner_same_sex_civil_partnership, :form_labelled, 'relationship.surviving-partner-from-a-same-sex-civil-partnership'do
            element :field, 'input'
            delegate :set, to: :field
          end
          section :prefer_not_to_say, :form_labelled, 'relationship.prefer_not_to_say' do
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
          if data[:relationship] != nil
            choose(data[:relationship], name: 'diversities_relationship[relationship]')
          end
          save_and_continue
        end

        def has_correct_translation?
          expect(feedback_notice).to have_language
          expect(main_content).to have_header
          expect(main_content).to have_single
          expect(main_content).to have_married
          expect(main_content).to have_separated
          expect(main_content).to have_widowed
          expect(main_content).to have_registered_same_sex_civil_partnership
          expect(main_content).to have_separated_same_sex_civil_partnership
          expect(main_content).to have_dissolved_same_sex_civil_partnership
          expect(main_content).to have_surviving_partner_same_sex_civil_partnership
          expect(main_content).to have_prefer_not_to_say
        end
      end
    end
  end
end