require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class SexualIdentityPage < BasePage
        section :main_content, '#content .main-section .main-content' do
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

        private

        def set_for_optional(answers, key, name)
          if answers.try(:[], key).present?
            data = answers.to_h
            choose(data[key], name: name)
          end
        end
      end
    end
  end
end