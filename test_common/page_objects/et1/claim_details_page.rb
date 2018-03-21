require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimDetailsPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          element :description, 'textarea[name="claim_details[claim_details]"]'
          section :similar_claims, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Similar claims")]] }) do
            section :other_claimants, '.claim_details_other_known_claimants' do
              def set(value)
                choose value, name: "claim_details[other_known_claimants]"
              end
            end
            element :names, 'textarea[name="claim_details[other_known_claimant_names]"]'
          end

          element :save_and_continue_button, 'form.edit_claim_details input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(user)
          claim = user[:claim]
          return if claim.nil?
          set_field main_content, :description, claim
          set_field main_content.similar_claims, :other_claimants, claim
          main_content.similar_claims.names.set claim[:other_claimant_names] if claim.key?(:other_claimant_names)
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end