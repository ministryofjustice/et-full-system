require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class ConfirmationPage < BasePage
        section :main_content, '#content .container' do
          element :main_header, '.main-header h1 span'
          element :confirmation, '#edit_diversities_confirmation .form-fields div p'
          element :return_button, 'a[title="return to GOV.UK website"]'
        end

        def return_to_gov_uk
          main_content.return_button.click
        end
      end
    end
  end
end