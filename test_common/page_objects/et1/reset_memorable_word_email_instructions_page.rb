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

        def submit
          fieldset.submit_button.click
        end

        def valid?
          expect(error).to have_invalid
        end

        private

        section :fieldset, 'fieldset' do
          element :email_address_element, 'input', id: 'user_email'
          element :claim_number_element, 'input', id: 'user_reference'
          element :submit_button, :submit_text, 'helpers.submit.user_session.reset_memorable_word'
        end
        section :error, '#error-summary' do
          element :invalid,:content_header, 'shared.error_notification.error_summary'
        end
      end
    end
  end
end
