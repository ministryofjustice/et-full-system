require_relative './base_page'
require_relative '../../../test_common/helpers/upload_helper'
module EtFullSystem
  module Test
    module Et1
      class ClaimDetailsPage < BasePage
        include RSpec::Matchers
        #Claim details
        element :page_header, :page_title, 'claims.claim_details.header', exact: false
        section :main_content, '#main-content' do
          include EtTestHelpers::Section

          # @!method error_summary
          #   A govuk error component
          #   @return [EtTestHelpers::Components::GovUKErrorSummary] The site prism section
          gds_error_summary :error_summary, :'shared.error_notification.default_message'
          #Describe your claim
          element :describe_your_claim, :legend_header, 'claims.claim_details.claim_details'
          #Write your claim statement below. Include the background, dates and people involved. 
          element :describe_your_claim_info, :paragraph, 'claims.claim_details.claim_details_html', exact: false
          #More about writing your claim statement.
          element :about_claim_info, :link_named, 'claims.claim_details.claim_details_hint', exact: false
          #Or upload it as a separate document
          element :upload_document, :summary_text, 'claims.claim_details.claim_details_upload' do
            element :selector, :css, '.summary'
            def set(*args); selector.set(*args); end
          end
          # @!method claim_details_claimt_details_rtf
          #   A govuk file field component wrapping the input, label, hint etc.. for the claim_details_claimt_details_rtf question
          #   @return [EtTestHelpers::Components::GovUKFileField] The site prism section
          gds_file_upload :claim_details_claim_details_rtf, :'simple_form.labels.claim_details.claim_details_rtf'
          # @!method file_upload
          #   A govuk file field component wrapping the input, label, hint etc.. for the file_upload question
          #   @return [EtTestHelpers::Components::GovUKFileField] The site prism section
          gds_file_upload :file_upload, :'simple_form.labels.claim_details.claim_details_rtf' do
            include ::EtFullSystem::Test::UploadHelper
            def set(value)
              force_remote do
                full_path = File.expand_path(File.join('test_common', 'fixtures', value))
                input.set(full_path)
              end
            end
          end

          # @!method claim_details_claim_details
          #   A govuk text area component wrapping the input, label, hint etc.. for a text area
          #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
          gds_text_area :claim_details_claim_details, :'claims.claim_details.claim_details' do
            element :claim_details_claim_details_hint, :form_hint, 'claims.claim_details.claim_details_hint_html'
          end

          #Similar claims
          # @!method claim_details_other_known_claimants_fieldset
          #   A govuk fieldset component
          #   @return [EtTestHelpers::Components::GovUKTextField] The site prism section
          gds_fieldset :claim_details_other_known_claimants_fieldset, :'claims.claim_details.similar_claims' do
            include EtTestHelpers::Section
            #Do you know of any other claimants (not already listed) making similar claims against the same employer? (optional)
            # @!method other_known_claimants
            #   A govuk radio button component for other_known_claimants question
            #   @return [EtTestHelpers::Components::GovUKCollectionRadioButtons] The site prism section
            gds_radios :other_known_claimants, :'simple_form.labels.claim_details.other_known_claimants' do
              element :yes, :form_labelled, 'claims.claim_type.yes'
              element :no, :form_labelled, 'claims.claim_type.no'
            end
          end
          # @!method other_known_claimant_names
          #   A govuk text area component for the 'You can add the names of other people here. (optional)' question
          #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
          gds_text_area :other_known_claimant_names, :'simple_form.labels.claim_details.other_known_claimant_names' do
            element :claim_details_other_known_claimant_names_hint, :form_hint, 'simple_form.hints.claim_details.other_known_claimants', exact: false
          end
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

        def has_mandatory_error_message?
          expect(main_content).to have_error_summary
          expect(main_content.claim_details_claim_details).to have_error(text: t('activemodel.errors.models.claim_details.attributes.claim_details.blank'))
        end

        def has_correct_translation?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          expect(feedback_notice).to have_feedback_info
          #Claim details
          expect(self).to have_page_header
          #Describe your claim
          expect(main_content).to have_describe_your_claim_info
          expect(main_content).to have_about_claim_info
          expect(main_content).to have_upload_document
          expect(main_content).to have_claim_details_claim_details_rtf
          expect(main_content.claim_details_claim_details_rtf).to have_hint(text: t('simple_form.hints.claim_details.claim_details_rtf'))
          #Limit is 2500 characters. (2500 characters remaining)
          expect(main_content.claim_details_other_known_claimants_fieldset).to have_other_known_claimants
          expect(main_content.claim_details_other_known_claimants_fieldset.other_known_claimants).to have_hint
          expect(main_content.claim_details_other_known_claimants_fieldset.other_known_claimants).to have_yes
          expect(main_content.claim_details_other_known_claimants_fieldset.other_known_claimants).to have_no
          #You can add the names of other people here. (optional)
          expect(main_content.other_known_claimant_names).to have_hint
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

        def set(claim)
          data = claim.to_h
          return if claim.nil?
          if data.key?(:rtf_file)
            main_content.upload_document.click
            main_content.file_upload.set(data[:rtf_file])
          end
          main_content.claim_details_claim_details.set(data[:description])
          main_content.claim_details_other_known_claimants_fieldset.other_known_claimants.set(data[:similar_claims])
          if data[:similar_claims] == :"claims.claim_type.yes"
            main_content.other_known_claimant_names.set(data[:other_claimant_names])
          end
        end
      end
    end
  end
end
