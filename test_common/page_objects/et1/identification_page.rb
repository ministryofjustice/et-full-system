require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class IdentificationPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :email, 'input[name="application_number[email_address]"]'
          element :memorable_word, 'input[name="application_number[password]"]'
          element :save_and_continue_button, 'input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(claimant)
          main_content.email.set(claimant.dig(:email_address))
          main_content.memorable_word.set(claimant.dig(:memorable_word))
        end
      end
    end
  end
end