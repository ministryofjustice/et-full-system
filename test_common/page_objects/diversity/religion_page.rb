require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class ReligionPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :other_religion, 'input[name="diversities_religion[religion_text]"]'
          element :save_and_continue_button, 'input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(answers)
          data = answers.to_h
          if data[:religion] != nil
            choose(data[:religion], name: 'diversities_religion[religion]')

            if data[:any_other_relgion_text] != nil
              main_content.other_religion.set(data[:any_other_relgion_text])
            end
          end
          save_and_continue
        end
      end
    end
  end
end