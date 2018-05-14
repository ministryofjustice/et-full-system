require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class RepresentativesDetailsPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          section :representatives_details, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("The person representing you")]] }) do
            section :representative, ".representative_has_representative" do
              def set(value)
                choose(value)
              end
            end
            section :about_your_representative, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("About your representative")]] }) do
              section :type, 'select[name="representative[type]"]' do
                def set(value)
                  root_element.select(value)
                end
              end
              element :organisation_name, 'input[name="representative[organisation_name]"]'
              element :name, 'input[name="representative[name]"]'
            end
            section :contact_details, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Representative’s contact details")]] }) do
              element :building, 'input[name="representative[address_building]"]'
              element :street, 'input[name="representative[address_street]"]'
              element :locality, 'input[name="representative[address_locality]"]'
              element :county, 'input[name="representative[address_county]"]'
              element :post_code, 'input[name="representative[address_post_code]"]'
              section :country, 'select[name="representative[address_country]"]' do
                def set(value)
                  root_element.select(value)
                end
              end
              element :telephone_number, 'input[name="representative[address_telephone_number]"]'
              element :alternative_telephone_number, 'input[name="representative[mobile_number]"]'
              element :email_address, 'input[name="representative[email_address]"]'
              element :dx_number, 'input[name="representative[dx_number]"]'
            end
          end
          element :save_and_continue_button, 'form.edit_representative input[value="Save and continue"]'

        end

        def set_for(representative)
          if representative.present?
            main_content.representatives_details.representative.set('Yes')
            main_content.representatives_details.about_your_representative do |s|
              set_field s, :type, representative
              set_field s, :organisation_name, representative
              set_field s, :name, representative
            end
            main_content.representatives_details.contact_details do |s|
              set_field s, :building, representative
              set_field s, :street, representative
              set_field s, :locality, representative
              set_field s, :county, representative
              set_field s, :post_code, representative
              set_field s, :telephone_number, representative
              set_field s, :alternative_telephone_number, representative
              set_field s, :email_address, representative
              set_field s, :dx_number, representative
            end
          else
            main_content.representatives_details.representative.set('No')
          end
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        private

        def set_field(s, key, representative)
          s.send(key).set(representative[key]) if representative.key?(key)
        end
      end
    end
  end
end