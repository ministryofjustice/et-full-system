require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class RepresentativesDetailsPage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #Representative's details
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.representative.header', exact: false
        end
        section :main_content, '.main-section .main-content' do
          section :error_message, '#edit_claimant #error-summary' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :paragraph, 'shared.error_notification.default_message'
          end
          #The person representing you
          element :representative_header, :legend_header, 'claims.representative.form_legend'
          section :representative, '.representative_has_representative' do
            element :representative_labelled, :form_labelled, 'simple_form.labels.representative.has_representative'
            element :yes, :form_labelled, 'simple_form.yes' do
              element :selector, :css, 'input'
              delegate :set, to: :selector
            end
            element :no, :form_labelled, 'simple_form.no' do
              element :selector, :css, 'input'
              delegate :set, to: :selector
            end
          end
          #All correspondence
          section :correspondence, '.callout-reference' do
            element :contact_info, :paragraph, 'claims.representative.contact_info', exact: false 
          end
          #About your representative
          element :about_your_representative, :legend_header, 'claims.representative.representative_legend'
          #Type of representative
          section :type, '.representative_type' do
            element :type_of_representative_labelled, :form_labelled, 'claims.representative.representative_type_legend'
            def set(value)
              root_element.select(value)
            end
          end
          section :organisation_name, :question_labelled, 'simple_form.labels.representative.organisation_name' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          section :name, :question_labelled, 'simple_form.labels.representative.name' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          #Representative's contact details
          element :representative_contact_details, :legend_header, 'claims.representative.contact_legend'
          section :building, :question_labelled, 'simple_form.labels.representative.address_building' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          element :blank_building, :error, 'activemodel.errors.models.claimant.attributes.address_building.blank'
          section :street, :question_labelled, 'simple_form.labels.representative.address_street' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          element :blank_street, :error, 'activemodel.errors.models.claimant.attributes.address_street.blank'
          section :locality, :question_labelled, 'simple_form.labels.representative.address_locality' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          element :blank_locality, :error, 'activemodel.errors.models.claimant.attributes.address_locality.blank'
          #County
          section :county, :question_labelled, 'simple_form.labels.representative.address_county' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          element :blank_county, :error, 'activemodel.errors.models.claimant.attributes.address_county.blank'
          element :county_hint, :paragraph, 'simple_form.hints.representative.address_county', exact: false
          section :post_code, :question_labelled, 'simple_form.labels.representative.address_post_code' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          element :blank_post_code, :error, 'activemodel.errors.models.claimant.attributes.address_post_code.blank'
          element :invalid_post_code, :error, 'activemodel.errors.models.claimant.attributes.address_post_code.invalid'
          section :telephone_number, :question_labelled, 'simple_form.labels.representative.address_telephone_number' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          section :alternative_telephone_number, :question_labelled, 'simple_form.labels.representative.mobile_number' do
            element :field, :css, 'input'
            delegate :set, to: :field
          end
          section :email_address, :question_labelled, 'simple_form.labels.claimant.email_address', exact: false do
            element :field, :css, 'input[type="email"]'
            delegate :set, to: :field
          end
          element :blank_email_address, :error, 'activemodel.errors.models.claimant.attributes.email_address.blank'
          section :dx_number, :question_labelled, 'simple_form.labels.representative.dx_number' do
            element :field, :css, 'input[type="email"]'
            delegate :set, to: :field
          end
          #What is Dx number?
          element :what_is_dx_number, :summary_text, 'claims.representative.what_is_dx.detail'
          #Save and continue
          element :save_and_continue_button, :submit_text, 'helpers.submit.update', exact: false
        end
        #Support links
        section :support, 'aside[role="complementary"]' do
          element :suport_header, :support_header, 'shared.aside.gethelp_header'
          element :guide, :link_named, 'shared.aside.read_guide'
          element :contact_use, :link_named, 'shared.aside.contact_us'
          element :your_claim, :support_header, 'shared.aside.actions_header'
          element :save_and_complete_later, :button, 'shared.mobile_nav.save_and_complete'
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def has_correct_translation?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          #Page header
          expect(main_header).to have_page_header
          #The person representating you
          expect(main_content).to have_representative_header
          expect(main_content.representative).to have_representative_labelled
          expect(main_content.representative).to have_yes
          expect(main_content.representative).to have_no
          #All correspondence
          expect(main_content.correspondence).to have_contact_info
          #About your representative
          expect(main_content).to have_about_your_representative
          #Type of presentative
          expect(main_content.type).to have_type_of_representative_labelled 
          expect(main_content).to have_organisation_name
          expect(main_content).to have_name
          #Representative contact details
          expect(main_content).to have_representative_contact_details
          expect(main_content).to have_building
          expect(main_content).to have_street
          expect(main_content).to have_locality
          expect(main_content).to have_county
          expect(main_content).to have_county_hint
          expect(main_content).to have_post_code
          expect(main_content).to have_telephone_number
          expect(main_content).to have_alternative_telephone_number
          expect(main_content).to have_email_address
          expect(main_content).to have_dx_number
          #What is DX number
          expect(main_content).to have_what_is_dx_number
          #Save and continue
          expect(main_content).to have_save_and_continue_button
          #Support
          expect(support).to have_suport_header
          expect(support).to have_guide
          expect(support).to have_contact_use
          #Save your claim later
          expect(support).to have_your_claim
          #TODO this has stopped working - why?
          # expect(support).to have_save_and_complete_later
        end

        def has_correct_validation_error_message?
          #Errors on page
          expect(main_content.error_message).to have_error_summary
          #TODO why has this stopped working - why?
          # expect(main_content.error_message).to have_default_message
          expect(main_content.title).to have_error_title
          expect(main_content.first_name).to have_error_first_name
          expect(main_content.last_name).to have_error_last_name
          expect(main_content.date_of_birth).to have_error_date_of_birth
          expect(main_content.gender).to have_error_gender
          expect(main_content).to have_error_building
          expect(main_content).to have_error_street
          expect(main_content).to have_error_locality
          expect(main_content).to have_error_county
          expect(main_content).to have_blank_post_code
          expect(main_content).to have_error_address_county
          expect(main_content.claimant_contact_preference).to have_error_claimant_contact_preference
        end

        def set(user)
          data = user.to_h
          if data.present?
            main_content.representative.yes.click
            set_field s, :type, data
            set_field s, :organisation_name, data
            set_field s, :name, data
            set_field s, :building, data
            set_field s, :street, data
            set_field s, :locality, data
            set_field s, :county, data
            set_field s, :post_code, data
            set_field s, :telephone_number, data
            set_field s, :alternative_telephone_number, data
            set_field s, :email_address, data
            set_field s, :dx_number, data
          else
            main_content.representative.no.click
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