require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class RepresentativesDetailsPage < BasePage
        include RSpec::Matchers
        #Representative's details
        element :page_header, :page_title, 'claims.representative.header', exact: false
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          # @!method error_summary
          #   A govuk error component
          #   @return [EtTestHelpers::Components::GovUKErrorSummary] The site prism section
          gds_error_summary :error_summary, :'shared.error_notification.default_message'

          #The person representing you
          element :representative_header, :legend_header, 'claims.representative.form_legend'
          element :representative_labelled, :legend_translated, 'simple_form.labels.representative.has_representative'
          section :representative, '.govuk-radios' do
            element :yes, :form_labelled, 'simple_form.yes' do
              element :selector, :css, 'input'
              def set(*args); selector.set(*args); end
            end
            element :no, :form_labelled, 'simple_form.no' do
              element :selector, :css, 'input'
              def set(*args); selector.set(*args); end
            end
          end
          #All correspondence
          element :contact_info, :paragraph, 'claims.representative.contact_info', exact: false
          #About your representative
          element :about_your_representative, :legend_header, 'claims.representative.representative_legend'
          # @!method type
          #   A govukselect component wrapping the select, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKCollectionSelect] The site prism section
          gds_select :type, :'claims.representative.representative_type_legend'
          section :organisation_name, :question_labelled, 'simple_form.labels.representative.organisation_name' do
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end
          section :name, :question_labelled, 'simple_form.labels.representative.name' do
            element :blank_organisation_name, :error, 'activemodel.errors.models.representative.attributes.name.blank'
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end
          #Representative's contact details
          element :representative_contact_details, :legend_header, 'claims.representative.contact_legend'
          # @!method building
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :building, :'simple_form.labels.representative.address_building'
          # @!method street
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :street, :'simple_form.labels.representative.address_street'
          # @!method locality
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :locality, :'simple_form.labels.representative.address_locality'
          #County
          # @!method county
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :county, :'simple_form.labels.representative.address_county'
          # @!method post_code
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :post_code, :'simple_form.labels.representative.address_post_code'
          element :blank_telephone_number, :error, 'activemodel.errors.models.representative.attributes.address_locality.blank'
          section :telephone_number, :question_labelled, 'simple_form.labels.representative.address_telephone_number' do
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end
          element :blank_mobile, :error, 'activemodel.errors.models.representative.attributes.address_locality.blank'
          section :alternative_telephone_number, :question_labelled, 'simple_form.labels.representative.mobile_number' do
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end
          element :invalid_email_address, :error, 'activemodel.errors.models.representative.attributes.email_address.invalid'
          element :blank_email_address, :error, 'activemodel.errors.models.representative.attributes.email_address.blank'
          section :email_address, :question_labelled, 'simple_form.labels.representative.email_address' do
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end

          # @!method representative_contact_preference
          #   A govuk radio button component for contact_preference question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          gds_radios :representative_contact_preference, :'claims.representative.contact_preference.label'

          section :dx_number, :question_labelled, 'simple_form.labels.representative.dx_number' do
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end
          #What is Dx number?
          element :what_is_dx_number, :summary_text, 'claims.representative.what_is_dx.detail'
          element :dx_information, :paragraph, 'claims.representative.what_is_dx.summary'
          #Save and continue
          element :save_and_continue_button, :submit_text, 'helpers.submit.update', exact: false
        end

        def save_and_continue
          page.scroll_to(main_content.save_and_continue_button, align: :bottom)
          main_content.save_and_continue_button.click
        end

        def switch_to_welsh
          feedback_notice.welsh_link.click
        end

        def switch_to_english
          feedback_notice.english_link.click
        end

        def has_correct_translation?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          expect(feedback_notice).to have_feedback_info
          #Page header
          expect(self).to have_page_header
          #The person representating you
          expect(main_content).to have_representative_header
          expect(main_content).to have_representative_labelled
          expect(main_content.representative).to have_yes
          expect(main_content.representative).to have_no
          #All correspondence
          expect(main_content).to have_contact_info
          #About your representative
          expect(main_content).to have_about_your_representative
          #Type of presentative
          expect(main_content).to have_type
          expect(main_content).to have_organisation_name
          expect(main_content).to have_name
          #Representative contact details
          expect(main_content).to have_representative_contact_details
          expect(main_content).to have_building
          expect(main_content).to have_street
          expect(main_content).to have_locality
          expect(main_content).to have_county
          expect(main_content.county).to have_hint(text: t('simple_form.hints.representative.address_county'))
          expect(main_content).to have_post_code
          expect(main_content).to have_telephone_number
          expect(main_content).to have_alternative_telephone_number
          expect(main_content).to have_representative_contact_preference
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
          expect(main_content).to have_error_summary
          expect(main_content).to have_type
          expect(main_content).to have_name
          expect(main_content.building).to have_error(text: t('activemodel.errors.models.representative.attributes.address_building.blank'))
          expect(main_content.street).to have_error(text: t('activemodel.errors.models.representative.attributes.address_street.blank'))
          expect(main_content.locality).to have_error(text: t('activemodel.errors.models.representative.attributes.address_locality.blank'))
          expect(main_content.county).to have_error(text: t('activemodel.errors.models.representative.attributes.address_county.blank'))
          expect(main_content.post_code).to have_error(text: t('activemodel.errors.models.representative.attributes.address_post_code.blank'))
          main_content.representative_contact_preference.assert_error_message(t 'claims.representative.contact_preference.errors.blank')
          true
        end

        def has_correct_error_message_for_invalid_uk_postcode?
          expect(main_content.post_code).to have_error(text: t('activemodel.errors.models.representative.attributes.address_post_code.invalid'))
        end

        def has_correct_dx_information?
          expect(main_content).to have_dx_information
        end

        def set(user)
          data = user[0].to_h
          if data[:representative_have] == 'Yes'
            main_content.representative.yes.click
            main_content do |s|
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
              set_field s, :representative_contact_preference, data
              set_field s, :email_address, data
              set_field s, :dx_number, data
            end
          else
            main_content.representative.no.click
          end
        end

        private
        
        def set_field(s, key, data)
          if data.key?(key)
            s.send(key).set(data[key])
          else
            s.send(key).set('')
          end
        end
      end
    end
  end
end
