require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class HealthPage < BasePage
        section :main_content, '#content .main-section .main-content' do
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
      end
    end
  end
end