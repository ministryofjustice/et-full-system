require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class IdentificationPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :claim_number, '.callout-reference .number'
          element :email, 'input[name="application_number[email_address]"]'
          element :memorable_word, 'input[name="application_number[password]"]'
          element :save_and_continue_button, 'input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(user)
          main_content.email.set(user[0].dig(:email_address))
          main_content.memorable_word.set(user[0].dig(:email_address))
        end
      end
    end
  end
end