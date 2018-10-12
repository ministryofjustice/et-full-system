require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimantDetailsPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #page and main header
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'simple_form.claims.claimant.header', exact: false
        end
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
            section :country, 'select[name="claimant[address_country]"]' do
              def set(value)
                root_element.select(value)
              end
            end
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
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
        end
        # Fills in the entire page for the user given
        #
        # @param [Hash] user The user hash
        def set_for(user)
          data = user[0].to_h
          main_content.about_the_claimant.tap do |s|
            set_field(s, :title, data)
            set_field(s, :first_name, data)
            set_field(s, :last_name, data)
            set_field(s, :date_of_birth, data)
            set_field(s, :gender, data)
            set_field(s, :has_special_needs, data)
            set_field(s, :special_needs, data)
          end

          main_content.claimants_contact_details.tap do |s|
            set_field(s, :building, data)
            set_field(s, :street, data)
            set_field(s, :locality, data)
            set_field(s, :county, data)
            set_field(s, :post_code, data)
            set_field(s, :country, data)
            set_field(s, :telephone_number, data)
            set_field(s, :alternative_telephone_number, data)
            set_field(s, :email_address, data)
            set_field(s, :correspondence, data)
          end
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end