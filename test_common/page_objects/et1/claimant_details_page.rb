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
          #About the claimant
          element :about_the_claimant_legend, :legend_header, ''
          #information about the person
          element :information_about_the_person, :paragraph, ''
          #title
          section :title, :question_labelled, '' do
            def set(value)
              root_element.select(value)
            end
          end
          #first name
          section :first_name, :question_labelled, '' do
            element :field, :css, "input"
            delegate :set, to: :field
          end
          #lastname name
          section :last_name, :question_labelled, '' do
            element :field, :css, "input"
            delegate :set, to: :field
          end
          #Date of birth
          section :date_of_birth_section, 'fieldset' do
            section :date_of_birth, :form_labelled, '' do
              section :day, :question_labelled, '' do
                element :field, :css, "input"
                delegate :set, to: :field
              end
              section :month, :question_labelled, '' do
                element :field, :css, "input"
                delegate :set, to: :field
              end
              section :year, :question_labelled, '' do
                element :field, :css, "input"
                delegate :set, to: :field
              end
            end
          end
          #Gender
          section :gender, :form_labelled, '' do
            element :male, :question_labelled, ''
            element :female, :question_labelled, ''
            element :prefer_not_to_say, :question_labelled, ''
            def set(value)
              choose(value, name: 'claimant[gender]')
            end
          end
          #disability
          section :has_special_needs, :question_labelled, '' do
            element :yes, :question_labelled, ''
            element :no, :question_labelled, ''
            def set(value)
              choose(value, name: 'claimant[has_special_needs]')
            end
          end
          element :special_needs, :question_labelled, ''
          #Claimant's contact details
          section :claimants_contact_details, :question_labelled, ''  do
            element :building, :question_labelled, ''
            element :street, :question_labelled, ''
            element :locality, :question_labelled, ''
            element :county, :question_labelled, ''
            element :post_code, :question_labelled, ''
            section :country, :question_labelled, '' do
              def set(value)
                root_element.select(value)
              end
            end
            element :telephone_number, :question_labelled, ''
            element :alternative_telephone_number, :question_labelled, ''
            element :email_address, :question_labelled, ''
            #best way to send correspondence
            section :correspondence, :question_labelled, '' do
              def set(value)
                choose(value, name: 'claimant[contact_preference]')
              end
            end
          end
          #Save and continue
          element :save_and_continue_button, :question_labelled, ''
        end
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
          element :your_claim, :support_header, 'shared.aside.actions_header'
          element :save_and_complete_later, :link_named, 'shared.mobile_nav.save_and_complete'
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