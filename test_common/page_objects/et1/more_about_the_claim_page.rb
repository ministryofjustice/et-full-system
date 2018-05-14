require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class MoreAboutTheClaimPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          section :other_important_details, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Other important details")]] }) do
            element :notes, 'textarea[name="additional_information[miscellaneous_information]"]'
            def set(value)
              choose value, name: "additional_information[has_miscellaneous_information]"
            end
          end

          element :save_and_continue_button, 'form.edit_additional_information input[value="Save and continue"]'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set_for(user)
          claim = FactoryBot.create(:claim).to_h
          return if claim.nil?
          if claim.key?(:other_important_details)
            main_content.other_important_details.set 'Yes'
            main_content.other_important_details.notes.set claim[:other_important_details]
          else
            main_content.other_important_details.set 'No'
          end
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end