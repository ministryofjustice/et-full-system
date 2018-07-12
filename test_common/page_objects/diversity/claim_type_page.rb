require_relative './base_page'
module EtFullSystem
  module Test
    module Diversity
      class ClaimTypePage < BasePage
        section :main_content, '#content .container .main-section .main-content' do
          section :form, '#edit_diversities_claim_type .form-fields' do
            section :claim_type, '.diversities_claim_type_claim_type div span' do
              element :unfair_dismissal, 'input[value="Unfair dismissal or constructive dismissal"]'
              element :discrimination, 'input[value="Discrimination"]'
              element :redundancy_payment, 'input[value="Redundancy payment"]'
              element :other_payment, 'input[value="Other payments you are owed"]'
              element :other_complaints, 'input[value="Other complaints"]'
              def set(value)
                choose(value, name: 'diversities_claim_type[claim_type]')
              end
            end
          end

          element :save_and_continue_button, 'input[value="Save and continue"]'
          end

          def save_and_continueexi
            main_content.save_and_continue_button.click
          end

          def set_for(data)
            set_field main_content.form, :claim_type, data
          end

          private

          def set_field(s, key, data)
            s.send(key).set(data[key]) if data.key?(key)
          end
      end
    end
  end
end