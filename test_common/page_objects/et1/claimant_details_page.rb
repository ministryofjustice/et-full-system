require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimantDetailsPage < BasePage
        include RSpec::Matchers
        #page and main header
        element :page_header, :page_title, 'claims.claimant.header', exact: false
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          include ::EtFullSystem::Test::I18n
          # @!method error_summary
          #   A govuk error component
          #   @return [EtTestHelpers::Components::GovUKErrorSummary] The site prism section
          gds_error_summary :error_summary, :'shared.error_notification.default_message'
          #About the claimant
          element :legend_personal_details, :legend_header, 'claims.claimant.legend_personal_details', exact: false
          #information about the person
          element :personal_details_description, :paragraph, 'claims.claimant.personal_details_description', exact: false

          # @!method title
          #   A govukselect component wrapping the select, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKCollectionSelect] The site prism section
          gds_select :title, :'simple_form.labels.claimant.title' do
            element :error_title, :error, 'activemodel.errors.models.claimant.attributes.title.blank', exact: false
          end

          #first name
          # @!method first_name
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :first_name, :'simple_form.labels.claimant.first_name'


          #lastname name
          # @!method last_name
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :last_name, :'simple_form.labels.claimant.last_name'
          #Date of birth
          # @!method date_of_birth
          #   A govuk date field component wrapping the inputs, label, hint etc.. for a date question
          #   @return [EtTestHelpers::Components::GovUKDateField] The site prism section
          gds_date_input :date_of_birth, :'claims.personal_details.date_of_birth' do
            section :day, :question_labelled, 'simple_form.labels.claimant.date_of_birth.day' do
              element :field, :css, '#claimant_date_of_birth_3i'
              def set(*args); field.set(*args); end
            end
            section :month, :question_labelled, 'simple_form.labels.claimant.date_of_birth.month' do
              element :field, :css, '#claimant_date_of_birth_2i'
              def set(*args); field.set(*args); end
            end
            section :year, :question_labelled, 'simple_form.labels.claimant.date_of_birth.year' do
              element :field, :css, '#claimant_date_of_birth_1i'
              def set(*args); field.set(*args); end
            end
          end
          gds_radios :gender, :'claims.claimant.gender' do
            include ::EtFullSystem::Test::I18n
            element :error_gender, :error, 'activemodel.errors.models.claimant.attributes.gender.blank'
          end
          #has special needs
          # @!method claimant_has_special_needs
          #   A govuk radio button component for claimant_has_special_needs question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          gds_radios :claimant_has_special_needs, :'simple_form.labels.claimant.has_special_needs'
          # @!method assistance
          #   A govuk text area component for the 'describe the assistance you require' question
          #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
          gds_text_area :assistance, :'simple_form.labels.claimant.special_needs'

          #Claimant's contact details
          element :claimants_contact_details, :legend_header, 'claims.claimant.legend_contact_details', exact: false
          # @!method building
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :building, :'simple_form.labels.claimant.address_building'
          # @!method street
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :street, :'simple_form.labels.claimant.address_street'
          # @!method locality
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :locality, :'simple_form.labels.claimant.address_locality'
          #County
          # @!method county
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :county, :'simple_form.labels.claimant.address_county'

          # @!method post_code
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :post_code, :'simple_form.labels.claimant.address_post_code'
          # @!method country
          #   A govuk radio button component for country question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          gds_radios :country, :'simple_form.labels.claimant.address_country'
          
          section :telephone_number, :question_labelled, 'simple_form.labels.claimant.address_telephone_number' do
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end
          section :alternative_telephone_number, :question_labelled, 'simple_form.labels.claimant.mobile_number' do
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end
          # @!method email_address
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKEmailField] The site prism section
          gds_email_input :email_address, :'simple_form.labels.claimant.email_address'
          #correspondence
          # @!method claimant_contact_preference
          #   A govuk radio button component for claimant_contact_preference question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          gds_radios :claimant_contact_preference, :'simple_form.labels.claimant.contact_preference'

          # @!method allow_video_attendance
          #   A govuk radio button component for allow_video_attendance question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          gds_radios :allow_video_attendance, :'simple_form.labels.claimant.allow_video_attendance'
          #Save and continue
          gds_submit_button :save_and_continue_button, t('helpers.submit.update')
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
          #About your claimant
          expect(main_content).to have_legend_personal_details
          expect(main_content).to have_personal_details_description
          expect(main_content).to have_title
          expect(main_content).to have_first_name
          expect(main_content).to have_last_name
          #date of birth
          expect(main_content).to have_date_of_birth
          expect(main_content.date_of_birth).to have_hint(text: t('simple_form.hints.claimant.date_of_birth'))
          expect(main_content.date_of_birth).to have_day
          expect(main_content.date_of_birth).to have_month
          expect(main_content.date_of_birth).to have_year
          #gender
          expect(main_content).to have_gender
          main_content.gender.assert_valid_options
          #has special needs
          main_content.claimant_has_special_needs.assert_valid_hint
          main_content.claimant_has_special_needs.assert_valid_options
          #Claimant's contact details
          expect(main_content).to have_claimants_contact_details
          expect(main_content).to have_building
          expect(main_content).to have_street
          expect(main_content).to have_locality
          expect(main_content).to have_county
          expect(main_content.county).to have_hint(text: t('simple_form.hints.claimant.address_county'))
          expect(main_content).to have_post_code
          expect(main_content).to have_country
          expect(main_content).to have_telephone_number
          expect(main_content).to have_alternative_telephone_number
          expect(main_content).to have_email_address
          #Best way to send correspondence
          main_content.claimant_contact_preference.assert_valid_hint
          main_content.claimant_contact_preference.assert_valid_options
          # Allow video attendance
          main_content.allow_video_attendance.assert_valid_options
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
        
        def has_correct_translation_for_assistance_required?
          expect(main_content).to have_assistance
        end

        def has_correct_error_message_for_leaving_email_address_field_blank?
          expect(main_content.email_address).to have_error(text: t('activemodel.errors.models.claimant.attributes.email_address.blank'))
        end

        def has_correct_error_message_for_invalid_email_address?
          expect(main_content.email_address).to have_error(text: t('activemodel.errors.models.claimant.attributes.email_address.invalid'))
        end

        def has_correct_error_message_for_invalid_uk_postcode?
          expect(main_content.post_code).to have_error(text: t('activemodel.errors.models.claimant.attributes.address_post_code.invalid'))
        end

        def has_correct_invalid_error_message_for_dob?
          expect(main_content.date_of_birth).to have_error(text: t('activemodel.errors.models.additional_claimants_form/additional_claimant.attributes.date_of_birth.invalid'))
        end

        def has_correct_invalid_error_message_for_allow_video_attendance?
          expect(main_content.allow_video_attendance).to have_error(text: t('activemodel.errors.models.claimant.attributes.allow_video_attendance.blank'))
        end

        def has_correct_validation_error_message?
          #Errors on page
          expect(main_content).to have_error_summary
          expect(main_content.first_name).to have_error(text: t('activemodel.errors.models.claimant.attributes.first_name.blank'))
          expect(main_content.last_name).to have_error(text: t('activemodel.errors.models.claimant.attributes.last_name.blank'))
          expect(main_content.date_of_birth).to have_error(text: t('activemodel.errors.models.claimant.attributes.date_of_birth.too_young'))
          expect(main_content.building).to have_error(text: t('activemodel.errors.models.claimant.attributes.address_building.blank'))
          expect(main_content.street).to have_error(text: t('activemodel.errors.models.claimant.attributes.address_street.blank'))
          expect(main_content.locality).to have_error(text: t('activemodel.errors.models.claimant.attributes.address_locality.blank'))
          expect(main_content.county).to have_error(text: t('activemodel.errors.models.claimant.attributes.address_county.blank'))
          expect(main_content.post_code).to have_error(text: t('activemodel.errors.models.claimant.attributes.address_post_code.blank'))
          expect(main_content.claimant_contact_preference).to have_error(text: t('activemodel.errors.models.claimant.attributes.contact_preference.blank'))
          expect(main_content.allow_video_attendance).to have_error(text: t('activemodel.errors.models.claimant.attributes.allow_video_attendance.blank'))
        end

        # Fills in the entire page for the user given
        #
        # @param [Hash] user The user hash
        def set(user)
          data = user[0].to_h
          main_content.tap do |s|
            set_field(s, :title, data) unless data[:title].nil?
            set_field(s, :first_name, data)
            set_field(s, :last_name, data)
            set_field(s, :date_of_birth, data)
            set_field(s, :gender, data)
          end

          main_content.claimant_has_special_needs.set(data[:has_special_needs])
          main_content.assistance.set(data[:special_needs]) if data[:has_special_needs].to_s.split('.').last == 'yes'

          main_content.claimant_contact_preference.set(data[:correspondence])
          main_content.allow_video_attendance.set(data[:allow_video_attendance])
          main_content.tap do |s|
            set_field(s, :building, data)
            set_field(s, :street, data)
            set_field(s, :locality, data)
            set_field(s, :county, data)
            set_field(s, :post_code, data)
            set_field(s, :country, data)
            set_field(s, :telephone_number, data)
            set_field(s, :alternative_telephone_number, data)
            set_field(s, :email_address, data) if data[:correspondence].to_s.split('.').last == 'email'
          end
        end

        def save_and_continue
          page.scroll_to(main_content.save_and_continue_button, align: :bottom)
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
