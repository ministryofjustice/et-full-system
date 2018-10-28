require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimTypePage < BasePage
      #your feedback header
      section :feedback_notice, '.feedback-notice' do
        include ::EtFullSystem::Test::I18n
        element :language, :link_named, 'switch.language'
        element :welsh_link, :link_or_button, t('switch.language', locale: :en)
        element :english_link, :link_or_button, t('switch.language', locale: :cy)
        element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
      end
      #About the claim
      section :main_header, '.main-header' do
        element :page_header, :page_title, 'claims.claim_type.header', exact: false
      end
        section :main_content, '#content .main-section .main-content' do
          section :claim_type, :xpath, (XPath.generate { |x| x.attr(:class).contains('legend') && x.descendant(:div)[x.descendant(:h2)[x.string.n.is("What your claim is about")]] }) do
            include ::EtFullSystem::Test::I18n
            def set(value)
              check factory_translate(value)
            end
          end

          section :whistleblowing_claim, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Whistleblowing claim")]] }) do
            def set(value)
              choose value, name: "claim_type[is_whistleblowing]"
            end
            section :send_to_relevant_person, '.claim_type_send_claim_to_whistleblowing_entity' do
              def set(value)
                choose value, name: "claim_type[send_claim_to_whistleblowing_entity]"
              end
            end
          end

          element :save_and_continue_button, 'form.edit_claim_type input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(claim)
          data = claim.to_h
          return if claim.nil?
          set_field main_content, :claim_type, data
          set_field main_content, :whistleblowing_claim, data
          set_field main_content.whistleblowing_claim, :send_to_relevant_person, data
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end
