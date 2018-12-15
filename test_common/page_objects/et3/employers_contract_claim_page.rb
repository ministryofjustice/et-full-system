require_relative './base_page'
module EtFullSystem
  module Test
    module Et3
      class EmployersContractClaimPage < BasePage
        include RSpec::Matchers
        section :switch_language, '.switch-language' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
        end
        element :error_header, :error_titled, 'errors.header', exact: true
        section :make_employer_contract_claim_question, :single_choice_option, 'questions.make_employer_contract_claim.label', exact: true do
          section :no, :gds_multiple_choice_option, 'questions.make_employer_contract_claim.no.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :yes, :gds_multiple_choice_option, 'questions.make_employer_contract_claim.yes.label', exact: true do
            element :selector, :css, 'input'
            def set(*args); selector.set(*args); end
          end
          section :claim_information, :textarea_labelled, 'questions.make_employer_contract_claim.claim_information.label', exact: true do
            def set(*args); root_element.set(*args); end
          end
          element :error_too_long, :exact_error_text, 'errors.messages.too_long', exact: false
          def set_for(user)
            if user.make_employer_contract_claim == "Yes"
              yes.set(true)
              claim_information.set(user.claim_information)
            else
              no.set(true)
            end
          end
        end
        # Save and continue
        element :continue_button, :submit_text, 'components.save_and_continue_button'
        def next
          continue_button.click
        end

        def switch_to_welsh
          switch_language.welsh_link.click
        end
  
        def switch_to_english
          switch_language.english_link.click
        end
      end
    end
  end
end
