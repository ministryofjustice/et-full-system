require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ResetMemorableWordEmailInstructionsPage < BasePage
        include EtTestHelpers::Page

        def using(email_address:, claim_number: nil)
          fieldset.email_address.set(email_address)
          fieldset.claim_number.set(claim_number) unless claim_number.nil?
          fieldset.submit_button.submit
          ReturnToYourClaimPage.new
        end

        def submit
          fieldset.submit_button.submit
        end

        def valid?
          expect(self).to have_error_summary
        end

        private

        section :fieldset, 'fieldset' do
          include EtTestHelpers::Section
          # @!method email_address
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :email_address, govuk_component(:text_field), :govuk_text_field, :'claims.reset_password.email_address.label'
          # @!method claim_number
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :claim_number, govuk_component(:text_field), :govuk_text_field, :'claims.reset_password.claim_number.label'
          # @!method submit_button
          #   A govuk submit button component...
          #   @return [EtTestHelpers::Components::GovUKSubmit] The site prism section
          section :submit_button, govuk_component(:submit), :govuk_submit, :'helpers.submit.user_session.reset_memorable_word'
        end
        # @!method error_summary
        #   A govuk error component
        #   @return [EtTestHelpers::Components::GovUKErrorSummary] The site prism section
        section :error_summary, govuk_component(:error_summary), :govuk_error_summary, :'shared.error_notification.default_message'
      end
    end
  end
end
