module EtFullSystem
  module Test
    module Admin
      class NewOfficePostcodesPage < Admin::BasePage
        element :select_office_id, 'select[id="office_post_code_office_id"]'
        element :input_postcode, 'input[id="office_post_code_postcode"]'
        element :inline_errors, '.inline-errors'
        element :create_office_post_code, 'input[type="submit"]'
        element :cancel, '.cancel'

        def create_office_postcode(office_name, postcode)
          select_office_id.select(office_name)
          input_postcode.set(postcode)
          create_office_post_code.click
        end
      end
    end
  end
end
