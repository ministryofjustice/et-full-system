require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimantDetailsPage < BasePage
        section :main_content, '#content .main-section .main-content' do
          section :about_the_claimant, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("About the claimant")]] }) do
            section :title, 'select[name="claimant[title]"]' do
              def set(value)
                root_element.select(value)
              end
            end
            element :first_name, 'input[name="claimant[first_name]"]'
            element :last_name, 'input[name="claimant[last_name]"]'
            section :date_of_birth, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Date of birth")]] }) do
              element :day, 'input[name="claimant[date_of_birth][day]"]'
              element :month, 'input[name="claimant[date_of_birth][month]"]'
              element :year, 'input[name="claimant[date_of_birth][year]"]'
              def set(value)
                (day_value, month_value, year_value) = value.split("/")
                day.set(day_value)
                month.set(month_value)
                year.set(year_value)
              end
            end
            section :gender, "div.claimant_gender" do
              element :male, 'input[value="male"]'
              element :female, 'input[value="female"]'
              element :prefer_not_to_say, 'input[value="prefer_not_to_say"]'
              def set(value)
                choose(value, name: 'claimant[gender]')
              end
            end

            section :has_special_needs, "div.claimant_has_special_needs" do
              element :yes, 'input[value="true"]'
              element :no, 'input[value="false"]'
              def set(value)
                choose(value, name: 'claimant[has_special_needs]')
              end
            end
            element :special_needs, 'textarea[name="claimant[special_needs]"]'
          end

          section :claimants_contact_details, :xpath, (XPath.generate { |x| x.descendant(:fieldset)[x.descendant(:legend)[x.string.n.is("Claimant’s contact details")]] }) do
            element :building, 'input[name="claimant[address_building]"]'
            element :street, 'input[name="claimant[address_street]"]'
            element :locality, 'input[name="claimant[address_locality]"]'
            element :county, 'input[name="claimant[address_county]"]'
            element :post_code, 'input[name="claimant[address_post_code]"]'
            element :country, 'select[name="claimant[address_country]"]'
            element :telephone_number, 'input[name="claimant[address_telephone_number]"]'
            element :alternative_telephone_number, 'input[name="claimant[mobile_number]"]'
            element :email_address, 'input[name="claimant[email_address]"]'
            section :correspondence, '.claimant_contact_preference' do
              def set(value)
                choose(value, name: 'claimant[contact_preference]')
              end
            end
          end

          element :save_and_continue_button, 'form.edit_claimant input[value="Save and continue"]'
        end

        # Fills in the entire page for the user given
        #
        # @param [Hash] user The user hash
        def set_for(claimant)
          main_content.about_the_claimant.tap do |s|
            set_field(s, :title, claimant)
            set_field(s, :first_name, claimant)
            set_field(s, :last_name, claimant)
            set_field(s, :date_of_birth, claimant)
            set_field(s, :gender, claimant)
            set_field(s, :has_special_needs, claimant)
            set_field(s, :special_needs, claimant)
          end

          main_content.claimants_contact_details.tap do |s|
            set_field(s, :building, claimant)
            set_field(s, :street, claimant)
            set_field(s, :locality, claimant)
            set_field(s, :county, claimant)
            set_field(s, :post_code, claimant)
            set_field(s, :country, claimant)
            set_field(s, :telephone_number, claimant)
            set_field(s, :alternative_telephone_number, claimant)
            set_field(s, :email_address, claimant)
            set_field(s, :correspondence, claimant)
          end
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        private

        def set_field(s, key, claimant)
          s.send(key).set(claimant[key]) if claimant.key?(key)
        end
      end
    end
  end
end