require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimOutcomePage < BasePage
        section :main_content, '#content .main-section .main-content' do

          section :preferred_outcome, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Choose your preferred outcome(s)")]] }) do
            element :notes, 'textarea[name="claim_outcome[other_outcome]"]'
            def set(value)
              check value
            end
          end

          element :save_and_continue_button, 'form.edit_claim_outcome input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(claim)
          data = claim.to_h
          return if data.nil?
          main_content.preferred_outcome do |s|
            s.set data[:preferred_outcome] if data.key?(:preferred_outcome)
            s.notes.set data[:preferred_outcome_notes] if data.key?(:preferred_outcome_notes)
          end
        end
      end
    end
  end
end