require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class EthnicGroupPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :save_and_continue_button, 'input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(answers)
          set_for_optional(answers, :ethnicity, 'diversities_ethnicity[ethnicity]')
          set_for_optional(answers, :ethnicity_subgroup, 'diversities_ethnicity[ethnicity_subgroup]')
          save_and_continue
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