require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimTypePage < BasePage
        include RSpec::Matchers
        #About the claim
        element :page_header, :page_title, 'claims.claim_type.header', exact: false
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          include EtFullSystem::Test::I18n
          # @!method error_message
          #   A govuk error component
          #   @return [EtTestHelpers::Components::GovUKErrorSummary] The site prism section
          gds_error_summary :error_message, :'shared.error_notification.default_message' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :li, 'activemodel.errors.models.claim_type.attributes.blank', exact: false
          end
          #What your claim is about
          element :about_claim, :content_header, 'claims.claim_type.claim_type'
          #Select at least one of the claim types below
          element :about_claim_info, :paragraph, 'claims.claim_type.claim_type_label'
          #Unfair dismissal
          section :unfair_dismissal, :legend_header, 'claims.claim_type.unfair_dismissal' do
            element :what_is_this, :summary_text, 'claims.claim_type.summary' do
              element :selector, :css, '.summary'
              def set(*args); selector.set(*args); end
            end
            element :unfair_dismissal_info, :paragraph, 'claims.claim_type.unfair_dismissal_summary_detail', exact: false
            element :unfair_dismissal_claim_type, :form_labelled, 'simple_form.labels.claim_type.is_unfair_dismissal' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
          end
          #Discrimination
          section :discrimination, :legend_header, 'claims.claim_type.discrimination' do
            #Sex
            element :sex_including_equal_pay_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.sex_including_equal_pay' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Race
            element :race_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.race' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Pregnancy or maternity
            element :pregnancy_or_maternity_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.pregnancy_or_maternity' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Sexual orientation
            element :sexual_orientation_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.sexual_orientation' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Gender reassignment
            element :gender_reassignment_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.gender_reassignment' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Disability
            element :disability_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.disability' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Age
            element :age_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.age' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Religion or belief
            element :religion_or_belief_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.religion_or_belief' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Marriage or civil partnership
            element :marriage_or_civil_partnership_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.marriage_or_civil_partnership' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
          end
          #Pay
          section :pay, :legend_header, 'claims.claim_type.pay' do
            #Redundancy pay
            element :redundancy_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.redundancy' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Holiday pay
            element :holiday_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.holiday' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Other payments
            element :other_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.other' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Notice pay
            element :notice_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.notice' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #Arrears of pay
            element :arrears_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.arrears' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
          end
          # Other type of claim (not shown above)
          # @!method other_type_of_claim
          # A govuk collection of checkboxes component for other_type_of_claim question
          # @return [EtTestHelpers::Components::GovUKCollectionCheckBoxes] The site prism section
          gds_checkboxes :other_type_of_claim, :'claims.claim_type.other_type' do
            #Other type of claim
            element :other_type_of_claim, :form_labelled, 'simple_form.labels.claim_type.is_other_type_of_claim'
          end

          #Give a very short description of your claim; you will have the opportunity to add more detail on the next page
          # @!method claim_type_other_claim_details
          #   A govuk text area component wrapping the input, label, hint etc.. for a text area
          #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
          gds_text_area :claim_type_other_claim_details, :'simple_form.labels.claim_type.other_claim_details'

          #Whistleblowing claim
          section :whistleblowing_claim, :legend_header, 'claims.claim_type.whistleblowing' do
            include EtTestHelpers::Section
            # @!method is_whistleblowing
            #   A govuk radio button component for is_whistleblowing question
            #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
            gds_radios :is_whistleblowing, :'simple_form.labels.claim.is_whistleblowing'

            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'claims.claim_type.yes'
            element :no, :form_labelled, 'claims.claim_type.no'

            def set(value)
              is_whistleblowing.set(value)
            end
          end

          # Do you want us to send a copy of your claim to the relevant person or body that deals with whistleblowing?
          # @!method send_to_relevant_person
          #   A govuk radio button component for send_to_relevant_person question
          #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
          gds_radios :send_to_relevant_person, :'simple_form.labels.claim_type.send_claim_to_whistleblowing_entity' do
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'simple_form.yes' do
              element :selector, :css, 'input'
              def set(*args); selector.set(*args); end
            end
            element :no, :form_labelled, 'simple_form.no' do
              element :selector, :css, 'input'
              def set(*args); selector.set(*args); end
            end
          end

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
          #About the claim
          expect(self).to have_page_header
          #What your claim is about
          expect(main_content).to have_about_claim
          #Select at least one of the claim types below
          expect(main_content).to have_about_claim_info
          #unfair_dismissal
          expect(main_content).to have_unfair_dismissal
          expect(main_content.unfair_dismissal).to have_what_is_this
          expect(main_content.unfair_dismissal).to have_unfair_dismissal_info
          expect(main_content.unfair_dismissal).to have_unfair_dismissal_claim_type
          #Discrimination
          expect(main_content.discrimination).to have_sex_including_equal_pay_claim_type
          expect(main_content.discrimination).to have_race_claim_type
          expect(main_content.discrimination).to have_pregnancy_or_maternity_claim_type
          expect(main_content.discrimination).to have_sexual_orientation_claim_type
          expect(main_content.discrimination).to have_gender_reassignment_claim_type
          expect(main_content.discrimination).to have_disability_claim_type
          expect(main_content.discrimination).to have_age_claim_type
          expect(main_content.discrimination).to have_religion_or_belief_claim_type
          expect(main_content.discrimination).to have_marriage_or_civil_partnership_claim_type
          #Pay
          expect(main_content.pay).to have_redundancy_claim_type
          expect(main_content.pay).to have_holiday_claim_type
          expect(main_content.pay).to have_other_claim_type
          expect(main_content.pay).to have_notice_claim_type
          expect(main_content.pay).to have_arrears_claim_type
          #Other type of cliam (not shown above)
          expect(main_content).to have_other_type_of_claim
          expect(main_content.other_type_of_claim).to have_hint(text: t('simple_form.hints.claim_type.is_other_type_of_claim'))
          expect(main_content.other_type_of_claim).to have_other_type_of_claim
          #Give a very short description of your claim
          expect(main_content.claim_type_other_claim_details).to have_hint(text: t('simple_form.hints.claim_type.other_claim_details'))
          #Whistleblowing claim
          expect(main_content.whistleblowing_claim).to have_is_whistleblowing
          expect(main_content.whistleblowing_claim.is_whistleblowing).to have_hint(text: t('simple_form.hints.claim_type.is_whistleblowing'))
          expect(main_content.whistleblowing_claim).to have_yes
          expect(main_content.whistleblowing_claim).to have_no
          #whistleblowing_entity
          expect(main_content).to have_send_to_relevant_person
          expect(main_content.send_to_relevant_person).to have_yes
          expect(main_content.send_to_relevant_person).to have_no
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

        def has_missing_claim_type_error_message?
          expect(main_content.error_message).to have_default_message
        end

        def save_and_continue
          page.scroll_to(main_content.save_and_continue_button, align: :bottom)
          main_content.save_and_continue_button.click
        end

        def set(claim)
          return if claim.nil? || claim.claim_types.nil?
          claim.claim_types.each do |claim_type|
            section, element = map_claim_type_section_element_from(claim_type)
            main_content.send(section).send(element).click
          end
          data = claim.to_h
          main_content.claim_type_other_claim_details.set(data[:other_type_of_claim_details]) unless data[:other_type_of_claim_details].nil?
          main_content.whistleblowing_claim.is_whistleblowing.set(data[:whistleblowing_claim])
          set_field main_content, :send_to_relevant_person, data
        end
        
        def map_claim_type_section_element_from(claim_type)
          case claim_type
          when :"simple_form.labels.claim_type.is_unfair_dismissal" then [:unfair_dismissal, :unfair_dismissal_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.sex_including_equal_pay" then [:discrimination, :sex_including_equal_pay_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.race" then [:discrimination, :race_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.pregnancy_or_maternity" then [:discrimination, :pregnancy_or_maternity_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.sexual_orientation" then [:discrimination, :sexual_orientation_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.gender_reassignment" then [:discrimination, :gender_reassignment_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.disability" then [:discrimination, :disability_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.age" then [:discrimination, :age_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.religion_or_belief" then [:discrimination, :religion_or_belief_claim_type]
          when :"simple_form.options.claim_type.discrimination_claims.marriage_or_civil_partnership" then [:discrimination, :marriage_or_civil_partnership_claim_type]
          when :"simple_form.options.claim_type.pay_claims.redundancy" then [:pay, :redundancy_claim_type]
          when :"simple_form.options.claim_type.pay_claims.holiday" then [:pay, :holiday_claim_type]
          when :"simple_form.options.claim_type.pay_claims.other" then [:pay, :other_claim_type]
          when :"simple_form.options.claim_type.pay_claims.notice" then [:pay, :notice_claim_type]
          when :"simple_form.options.claim_type.pay_claims.arrears" then [:pay, :arrears_claim_type]
          when :"simple_form.labels.claim_type.is_other_type_of_claim" then [:other_type_of_claim, :other_type_of_claim]
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
