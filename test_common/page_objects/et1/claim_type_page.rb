require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimTypePage < BasePage
        section :main_content, '#content .main-section .main-content' do
          section :claim_type, :xpath, (XPath.generate { |x| x.attr(:class).contains('legend') && x.descendant(:div)[x.descendant(:h2)[x.string.n.is("What your claim is about")]] }) do
            def set(value)
              check value
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

        def set_for(user)
          claim = user[:claim]
          return if claim.nil?
          set_field main_content, :claim_type, claim
          set_field main_content, :whistleblowing_claim, claim
          set_field main_content.whistleblowing_claim, :send_to_relevant_person, claim
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end