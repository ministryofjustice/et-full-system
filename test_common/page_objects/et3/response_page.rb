require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class ResponsePage < BasePage
        set_url '/respond/response'
        element :error_header, :error_titled, 'errors.header', exact: true
        section :defend_claim_question, :single_choice_option, 'questions.defend_claim.label', exact: false do
          section :yes, :gds_multiple_choice_option, 'questions.defend_claim.yes.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :no, :gds_multiple_choice_option, 'questions.defend_claim.no.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :defend_claim_facts, :textarea_labelled, 'questions.defend_claim.defend_claim_facts.label', exact: false do
            def set(*args); root_element.set(*args); end
          end
          element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
          element :error_inclusion, :exact_error_text, 'errors.messages.inclusion', exact: false
          def set_for(user)
            if user.defend_claim == 'Yes'
              yes.set(true)
              defend_claim_facts.set(user.defend_claim_facts)
            else
              no.set(true)
            end
          end
        end
        element :continue_button, :button, "Save and continue"
        def next
          continue_button.click
        end
      end
    end
  end
end
