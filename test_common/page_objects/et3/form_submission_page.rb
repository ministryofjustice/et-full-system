# TODO: Refactor so as not to use CSS selectors
require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class FormSubmissionPage < BasePage
        set_url '/respond/form_submission'
        element :local_office_address, :css, '.office-address'
        element :local_office_phone, :css, '.office-phone'
        element :submission_confirmation, :css, '.submission-confirmation'
        element :reference_number, :css, '.reference-number'
        element :submission_date, :css, '.submission-date'
        element :download_pdf, :css, '.download-pdf'
        element :return_to_govuk_button, :css, 'a.button.button-start'
        def return
          return_to_govuk_button.click
        end
      end
    end
  end
end
