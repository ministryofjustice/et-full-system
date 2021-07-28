require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class RespondentsDetailsPage < BasePage
        include RSpec::Matchers
        #Respondent's details
        element :page_header, :page_title, 'claims.respondent.header', exact: false
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          include EtFullSystem::Test::I18n
          # @!method error_summary
          #   A govuk error component
          #   @return [EtTestHelpers::Components::GovUKErrorSummary] The site prism section
          gds_error_summary :error_summary, :'shared.error_notification.default_message'

          #About the respondent
          element :respondent_header, :legend_header, 'claims.respondent.respondent_legend'
          element :respondent_summary, :paragraph, 'claims.respondent.form_hint'
          # @!method name
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :name, :'simple_form.labels.respondent.name'
          # @!method building
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :building, :'simple_form.labels.respondent.address_building'
          # @!method street
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :street, :'simple_form.labels.respondent.address_street'
          # @!method locality
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :locality, :'simple_form.labels.respondent.address_locality'
          # @!method county
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :county, :'simple_form.labels.respondent.address_county'

          # @!method post_code
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :post_code, :'simple_form.labels.respondent.address_post_code'

          section :telephone_number, :question_labelled, 'simple_form.labels.respondent.address_telephone_number' do
            element :field, :css, 'input'
            def set(*args); field.set(*args); end
          end
          #Your work address
          element :work_address_header, :legend_header, 'claims.respondent.workaddress_legend'

          # @!method work_address
          #   A govuk fieldset component
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_fieldset :work_address, :'claims.respondent.workaddress_legend' do
            include EtTestHelpers::Section
            element :work_address_hint, :paragraph, 'claims.respondent.work_address'

            section :same_address, :legend_header, 'simple_form.labels.respondent.worked_at_same_address' do
              include ::EtFullSystem::Test::I18n
              element :yes, :form_labelled, 'simple_form.labels.respondent.yes' do
                element :selector, :css, 'input[type="radio"]'
                def set(*args); selector.set(*args); end
              end
              element :no, :form_labelled, 'simple_form.labels.respondent.no' do
                element :selector, :css, 'input[type="radio"]'
                def set(*args); selector.set(*args); end
              end
              def set(value)
                choose(factory_translate(value), name: 'respondent[worked_at_same_address]')
              end
            end

            # @!method building_optional
            #   A govuk text field component wrapping the input, label, hint etc..
            #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
            gds_text_input :building_optional, :'simple_form.labels.respondent.work_address_building'
            # @!method street_optional
            #   A govuk text field component wrapping the input, label, hint etc..
            #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
            gds_text_input :street_optional, :'simple_form.labels.respondent.work_address_street'
            # @!method locality_optional
            #   A govuk text field component wrapping the input, label, hint etc..
            #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
            gds_text_input :locality_optional, :'simple_form.labels.respondent.work_address_locality'
            # @!method county_optional
            #   A govuk text field component wrapping the input, label, hint etc..
            #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
            gds_text_input :county_optional, :'simple_form.labels.respondent.work_address_county'
            # @!method post_code_optional
            #   A govuk text field component wrapping the input, label, hint etc..
            #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
            gds_text_input :post_code_optional, :'simple_form.labels.respondent.work_address_post_code'

            # @!method telephone_number_optional
            #   A govuk phone field component representing the phone or mobile question
            #   @return [EtTestHelpers::Components::GovUKPhoneField] The site prism section
            gds_phone_input :telephone_number_optional, :'simple_form.labels.respondent.work_address_telephone_number'
          end

          #Acas early conciliation certificate number
          # @!method acas_certificate_number
          #   A govuk text field component wrapping the input, label, hint etc..
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_text_input :acas_certificate_number, :'claims.respondent.acas_legend'

          # @!method no_acas_number
          #   A govuk radio button component for no_acas_number question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          gds_radios :no_acas_number, :'simple_form.labels.respondent.no_acas_number'

          #section :acas_certificate_number, '.respondent_acas_early_conciliation_certificate_number' do
          #element :acas_hint, :paragraph, 'claims.respondent.acas_early_conciliation_certificate_number_html', exact: false
          #element :certificate_number, :link_named, 'claims.respondent.acas_early_conciliation_certificate_number_link', exact: false
          #element :field, :css, 'input'
          #def set(*args)
          #field.set(*args)
          #end
          #end
          #I don't have an Acas number
          element :yes_no_acas_number, '#respondent-no-acas-number-true-field'
          element :joint_claimant_has_acas_number, :form_labelled, 'simple_form.options.respondent.no_acas_number_reason.joint_claimant_has_acas_number' do
            element :selector, :css, 'input[type="radio"]'
            def set(*args); selector.set(*args); end
          end
          element :acas_has_no_jurisdiction, :form_labelled, 'simple_form.options.respondent.no_acas_number_reason.acas_has_no_jurisdiction' do
            element :selector, :css, 'input[type="radio"]'
            def set(*args); selector.set(*args); end
          end
          element :employer_contacted_acas, :form_labelled, 'simple_form.options.respondent.no_acas_number_reason.employer_contacted_acas' do
            element :selector, :css, 'input[type="radio"]'
            def set(*args); selector.set(*args); end
          end
          element :interim_relief, :form_labelled, 'simple_form.options.respondent.no_acas_number_reason.interim_relief' do
            element :selector, :css, 'input[type="radio"]'
            def set(*args); selector.set(*args); end
          end
          # @!method respondent_no_acas_number_reason
          #   A govuk radio button component for respondent_no_acas_number_reason question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          gds_radios :respondent_no_acas_number_reason, :'claims.respondent.no_acas_number_reason'
          #Save and continue
          gds_submit_button :save_and_continue_button, t('helpers.submit.update')
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
          #Respoondent's details
          expect(self).to have_page_header
          #About the respondent
          expect(main_content).to have_respondent_header
          expect(main_content).to have_respondent_summary
          #Respondent contact details
          expect(main_content).to have_name
          expect(main_content).to have_building
          expect(main_content).to have_street
          expect(main_content).to have_locality
          expect(main_content).to have_county
          expect(main_content.county).to have_hint(text: t('simple_form.hints.respondent.address_county'))
          expect(main_content).to have_post_code
          expect(main_content).to have_telephone_number
          #Your work address
          expect(main_content).to have_work_address_header
          expect(main_content.work_address.same_address).to have_yes
          expect(main_content.work_address.same_address).to have_no
          #Different work address
          expect(main_content.work_address).to have_work_address_hint
          expect(main_content.work_address).to have_building_optional
          expect(main_content.work_address).to have_street_optional
          expect(main_content.work_address).to have_locality_optional
          expect(main_content.work_address).to have_county_optional
          expect(main_content.work_address.county_optional).to have_hint(text: t('simple_form.hints.respondent.address_county'))
          expect(main_content.work_address).to have_post_code_optional
          expect(main_content.work_address).to have_telephone_number_optional
          #Acas early conciliation certifcate number
          expect(main_content.acas_certificate_number).to have_hint(text: t('claims.respondent.acas_early_conciliation_certificate_number_html'))
          #I don't have an acas number
          expect(main_content).to have_no_acas_number
          #Why don't you have an Acas number?
          expect(main_content.respondent_no_acas_number_reason).to have_hint(text: t('claims.respondent.no_acas_number_note_one'))
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

        def has_correct_blank_validation_error_messages?
          expect(main_content).to have_error_summary
          expect(main_content.name).to have_error(text: t('activemodel.errors.models.respondent.attributes.name.blank'))
          expect(main_content.building).to have_error(text: t('activemodel.errors.models.respondent.attributes.address_building.blank'))
          expect(main_content.street).to have_error(text: t('activemodel.errors.models.respondent.attributes.address_street.blank'))
          expect(main_content.locality).to have_error(text: t('activemodel.errors.models.respondent.attributes.address_locality.blank'))
          expect(main_content.county).to have_error(text: t('activemodel.errors.models.respondent.attributes.address_county.blank'))
          expect(main_content.post_code).to have_error(text: t('activemodel.errors.models.respondent.attributes.address_post_code.blank'))
          expect(main_content.work_address.building_optional).to have_error(text: t('activemodel.errors.models.respondent.attributes.work_address_building.blank'))
          expect(main_content.work_address.street_optional).to have_error(text: t('activemodel.errors.models.respondent.attributes.work_address_street.blank'))
          expect(main_content.work_address.locality_optional).to have_error(text: t('activemodel.errors.models.respondent.attributes.work_address_locality.blank'))
          expect(main_content.work_address.post_code_optional).to have_error(text: t('activemodel.errors.models.respondent.attributes.work_address_post_code.blank'))
          expect(main_content.respondent_no_acas_number_reason).to have_error(text: t('activemodel.errors.models.respondent.attributes.no_acas_number_reason.blank'))
        end

        def has_correct_error_message_for_invalid_uk_postcode?
          expect(main_content.post_code).to have_error(text: t('activemodel.errors.models.respondent.attributes.address_post_code.invalid'))
        end

        def set(respondent)
          data = respondent[0].to_h
          return if data.nil? || data.empty?
          main_content do |s|
            set_field s, :name, data
            set_field s, :building, data
            set_field s, :street, data
            set_field s, :locality, data
            set_field s, :county, data
            set_field s, :post_code, data
            set_field s, :telephone_number, data
          end
          if data.key?(:work_building)
            main_content.work_address.same_address.no.click
            main_content.work_address.building_optional.set(data[:work_building])
            main_content.work_address.street_optional.set(data[:work_street])
            main_content.work_address.locality_optional.set(data[:work_locality])
            main_content.work_address.county_optional.set(data[:work_county])
            main_content.work_address.post_code_optional.set(data[:work_post_code])
            main_content.work_address.telephone_number_optional.set(data[:work_telephone_number])
          else
            main_content.work_address.same_address.yes.click
          end

          # @TODO Dont commit this
          if data.key?(:no_acas_number_reason)
            main_content.no_acas_number.set(:'simple_form.labels.respondent.no')
            main_content.respondent_no_acas_number_reason.set(data[:no_acas_number_reason])
          else
            main_content.no_acas_number.set(:'simple_form.labels.respondent.yes')
          end
          if data.key?(:acas_number)
            main_content.no_acas_number.set(:'simple_form.labels.respondent.yes')
            main_content.acas_certificate_number.set(data[:acas_number])
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
