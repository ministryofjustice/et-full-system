require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ResetMemorableWordPage < BasePage

        def set_memorable_word(value)
          memorable_word_element.set(value)
          submit_button.click
          ReturnToYourClaimPage.new
        end

        # @param [String] email_address
        # @return [ET1::Test::ResetMemorableWordPage]
        # Loads the memorable word page referenced in the email for a specific email address
        def from_email_for(email_address)
          email = EtFullSystem::Test::Et1ResetPasswordEmailHtml.find(email_address: email_address)
          raise Capybara::ElementNotFound, "Email not found for #{email_address}" if email.nil?
          visit email.reset_memorable_word_url
          self
        end

        private

        element :memorable_word_element,'input', id: 'user_password'
        element :submit_button, :submit_text, 'helpers.submit.user_session.reset_memorable_word'
      end
    end
  end
end
