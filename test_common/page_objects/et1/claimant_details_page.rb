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
          # @!method error_summary
          #   A govuk error component
          #   @return [EtTestHelpers::Components::GovUKErrorSummary] The site prism section
          section :error_summary, govuk_component(:error_summary), :govuk_error_summary, :'shared.error_notification.default_message'
          #About the claimant
          element :legend_personal_details, :legend_header, 'claims.claimant.legend_personal_details', exact: false
          #information about the person
          element :personal_details_description, :paragraph, 'claims.claimant.personal_details_description', exact: false

          # @!method title
          #   A govukselect component wrapping the select, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKCollectionSelect] The site prism section
          section :title, govuk_component(:collection_select), :govuk_collection_select, :'simple_form.labels.claimant.title' do
            element :error_title, :error, 'activemodel.errors.models.claimant.attributes.title.blank', exact: false
          end

          #first name
          # @!method first_name
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :first_name, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.first_name'


          #lastname name
          # @!method last_name
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :last_name, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.last_name'
          #Date of birth
          # @!method date_of_birth
          #   A govuk date field component wrapping the inputs, label, hint etc.. for a date question
          #   @return [EtTestHelpers::Components::GovUKDateField] The site prism section
          section :date_of_birth, govuk_component(:date_field), :govuk_date_field, :'claims.personal_details.date_of_birth' do
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
          section :gender, :legend_header, 'claims.claimant.gender', exact: false do
            include ::EtFullSystem::Test::I18n
            element :error_gender, :error, 'activemodel.errors.models.claimant.attributes.gender.blank'
            element :male, :form_labelled, 'simple_form.options.claimant.gender.male' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            element :female, :form_labelled, 'simple_form.options.claimant.gender.female' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            element :prefer_not_to_say, :form_labelled, 'simple_form.options.claimant.gender.prefer_not_to_say' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            def set(value)
              choose(factory_translate(value), name: 'claimant[gender]') unless value.nil?
            end
          end
          #has special needs
          # @!method claimant_has_special_needs
          #   A govuk radio button component for claimant_has_special_needs question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :claimant_has_special_needs, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'simple_form.labels.claimant.has_special_needs' do
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'simple_form.yes' do
              element :selector, :css, '#claimant_has_special_needs_true'
              def set(*args); selector.set(*args); end
            end
            element :no, :form_labelled, 'simple_form.no' do
              element :selector, :css, '#claimant_has_special_needs_false'
              def set(*args); selector.set(*args); end
            end
          end
          # @!method assistance
          #   A govuk text area component for the 'describe the assistance you require' question
          #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
          section :assistance, govuk_component(:text_area), :govuk_text_area, :'simple_form.labels.claimant.special_needs'

          #Claimant's contact details
          element :claimants_contact_details, :legend_header, 'claims.claimant.legend_contact_details', exact: false
          # @!method building
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :building, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_building'
          # @!method street
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :street, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_street'
          # @!method locality
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :locality, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_locality'
          #County
          # @!method county
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :county, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_county'

          # @!method post_code
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          section :post_code, govuk_component(:text_field), :govuk_text_field, :'simple_form.labels.claimant.address_post_code'
          # @!method country
          #   A govuk radio button component for country question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :country, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'simple_form.labels.claimant.address_country'
          
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
          section :email_address, govuk_component(:email_field), :govuk_email_field, :'simple_form.labels.claimant.email_address'
          #correspondence
          # @!method claimant_contact_preference
          #   A govuk radio button component for claimant_contact_preference question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :claimant_contact_preference, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'simple_form.labels.claimant.contact_preference' do
            include ::EtFullSystem::Test::I18n
            section :email_preference, :form_labelled, 'simple_form.options.claimant.contact_preference.email' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            section :post_preference, :form_labelled, 'simple_form.options.claimant.contact_preference.post' do 
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            def set(value)
              choose(factory_translate(value), name: 'claimant[contact_preference]')
            end
          end

          # @!method allow_video_attendance
          #   A govuk radio button component for allow_video_attendance question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          section :allow_video_attendance, govuk_component(:collection_radio_buttons), :govuk_collection_radio_buttons, :'simple_form.labels.claimant.allow_video_attendance' do
            include ::EtFullSystem::Test::I18n
            element :allow_video_attendance_hint, :paragraph, 'simple_form.hints.claimant.allow_video_attendance'
            section :yes, :form_labelled, 'simple_form.options.claimant.allow_video_attendance.yes' do
              element :selector, :css, '#claimant_allow_video_attendance_true'
              def set(*args); selector.set(*args); end
            end
            element :no, :form_labelled, 'simple_form.options.claimant.allow_video_attendance.no' do
              element :selector, :css, '#claimant_allow_video_attendance_false'
              def set(*args); selector.set(*args); end
            end
            def set(value)
              choose(factory_translate(value), name: 'claimant[allow_video_attendance]')
            end
          end
          #Save and continue
          element :save_and_continue_button, :submit_text, 'helpers.submit.update', exact: false
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
          expect(main_content.gender).to have_male
          expect(main_content.gender).to have_female
          expect(main_content.gender).to have_prefer_not_to_say
          #has special needs
          expect(main_content.claimant_has_special_needs).to have_hint(text: t('simple_form.hints.claimant.has_special_needs'))
          expect(main_content.claimant_has_special_needs).to have_yes
          expect(main_content.claimant_has_special_needs).to have_no
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
          expect(main_content.claimant_contact_preference).to have_hint(text: t('simple_form.hints.claimant.contact_preference'))
          expect(main_content.claimant_contact_preference).to have_email_preference
          expect(main_content.claimant_contact_preference).to have_post_preference
          # Allow video attendance
          expect(main_content.allow_video_attendance).to have_yes
          expect(main_content.allow_video_attendance).to have_no
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
