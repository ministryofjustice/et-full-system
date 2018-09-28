require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class AgeGroupCaringResponsibilities < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :save_and_continue_button, 'input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(answers)
          set_for_optional(answers, :age_group, 'diversities_age_caring[age_group]')
          set_for_optional(answers, :caring_responsibility, 'diversities_age_caring[caring_responsibility]')
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