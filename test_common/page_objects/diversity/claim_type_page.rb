require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class ClaimTypePage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :save_and_continue_button, 'input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(answers)
          data = answers.to_h
          if data[:claim_type] != nil
            choose(data[:claim_type], name: 'diversities_claim_type[claim_type]')
          end
          save_and_continue
        end
      end
    end
  end
end