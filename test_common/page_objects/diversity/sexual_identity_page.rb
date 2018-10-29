require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class SexualIdentityPage < BasePage
        include RSpec::Matchers
        set_url "#{::EtFullSystem::Test::Configuration.diversity_url}/identity"

        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end

        section :main_content, '.container' do
          element :header, :main_header, 'sexual_identity.header', exact: false

          section :sex, :question_labelled, 'sexual_identity.sex' do
            section :male, :form_labelled, 'sex.male' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :female, :form_labelled, 'sex.female' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :prefer_not_to_say, :form_labelled, 'sex.prefer_not_to_say' do
              element :field, 'input'

              delegate :set, to: :field
            end
          end

          section :gender, :question_labelled, 'sexual_identity.gender' do
            section :male, :form_labelled, 'gender.male' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :female, :form_labelled, 'gender.female' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :prefer_not_to_say, :form_labelled, 'gender.prefer_not_to_say' do
              element :field, 'input'

              delegate :set, to: :field
            end
          end

          section :gender_at_birth, :question_labelled, 'sexual_identity.gender_at_birth' do
            section :yes, :form_labelled, 'gender_at_birth.yes_answer' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :no, :form_labelled, 'gender_at_birth.no_answer' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :prefer_not_to_say, :form_labelled, 'gender_at_birth.prefer_not_to_say' do
              element :field, 'input'

              delegate :set, to: :field
            end
          end

          section :your_sexual_identity, :question_labelled, 'sexual_identity.your_sexual_identity' do
            section :heterosexual, :form_labelled, 'your_sexual_identity.heterosexual-straight' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :gay, :form_labelled, 'your_sexual_identity.gay-lesbian' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :bisexual, :form_labelled, 'your_sexual_identity.bisexual' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :other, :form_labelled, 'your_sexual_identity.other' do
              element :field, 'input'

              delegate :set, to: :field
            end

            section :prefer_not_to_say, :form_labelled, 'your_sexual_identity.prefer_not_to_say' do
              element :field, 'input'

              delegate :set, to: :field
            end
          end

          element :save_and_continue_button, 'input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(answers)
          set_for_optional(answers, :sex, 'diversities_identity[sex]')
          set_for_optional(answers, :gender, 'diversities_identity[gender]')
          set_for_optional(answers, :gender_at_birth, 'diversities_identity[gender_at_birth]')
          set_for_optional(answers, :sexual_identity, 'diversities_identity[sexual_identity]')
          save_and_continue
        end

        def has_correct_translation?
          expect(feedback_notice).to have_language

          expect(main_content).to have_header

          expect(main_content.sex).to have_male
          expect(main_content.sex).to have_female
          expect(main_content.sex).to have_prefer_not_to_say

          expect(main_content.gender).to have_male
          expect(main_content.gender).to have_female
          expect(main_content.gender).to have_prefer_not_to_say

          expect(main_content.gender_at_birth).to have_yes
          expect(main_content.gender_at_birth).to have_no
          expect(main_content.gender_at_birth).to have_prefer_not_to_say

          expect(main_content.your_sexual_identity).to have_heterosexual
          expect(main_content.your_sexual_identity).to have_gay
          expect(main_content.your_sexual_identity).to have_bisexual
          expect(main_content.your_sexual_identity).to have_other
          expect(main_content.your_sexual_identity).to have_prefer_not_to_say
        end

        private

        def set_for_optional(answers, key, name)
          data = answers.to_h
          if data[key] != nil
            choose(data[key], name: name)
          end
        end
      end
    end
  end
end