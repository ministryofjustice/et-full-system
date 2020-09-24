require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ResetMemorableWordEmailInstructionsPage < BasePage

        def using(email_address:, claim_number: nil)
          fieldset.email_address_element.set(email_address)
          fieldset.claim_number_element.set(claim_number) unless claim_number.nil?
          fieldset.submit_button.click
          ReturnToYourClaimPage.new
        end

        private

        section :fieldset, 'fieldset' do
          element :email_address_element, 'input', id: 'user_email'
          element :claim_number_element, 'input', id: 'user_reference'
          element :submit_button, :submit_text, 'helpers.submit.user_session.reset_memorable_word'
        end
      end
    end
  end
end
