require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class SubmissionPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :submit_claim_button, 'form.new_confirmation_email input[value="Submit claim"]'
        end

        def submit_claim
          main_content.submit_claim_button.click
        end
      end
    end
  end
end