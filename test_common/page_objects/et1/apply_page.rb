require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ApplyPage < BasePage
        set_url '/apply'
        element :error_header, :error_titled, 'errors.header', exact: true
        section :case_number_question, :question_labelled, 'questions.case_number.label', exact: false do
          element :field, :css, "input"
          element :error_invalid, :exact_error_text, 'errors.messages.invalid', exact: false
          delegate :set, to: :field
        end
      end
    end
  end
end