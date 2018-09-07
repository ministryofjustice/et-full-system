require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class SubmissionFormPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :submit_form, 'input[value="Submit Form"]'
        end

        def submit_form
          main_content.submit_form.click
        end
      end
    end
  end
end