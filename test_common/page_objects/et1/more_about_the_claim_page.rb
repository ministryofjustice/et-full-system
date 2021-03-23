require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class MoreAboutTheClaimPage < BasePage
        include RSpec::Matchers
        #More about the claim
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.additional_information.header', exact: false
        end
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          #Other important details
          section :other_important_details, :legend_header, 'claims.additional_information.legend' do
            #Do you want to provide additional information about your claim? (optional)
            element :miscellaneous_information, :form_labelled, 'claims.additional_information.has_miscellaneous_information'
            #Include anything that will help the tribunal come to a decision about whether your case can be heard. What you write may be seen by the respondent
            element :miscellaneous_information_hint , :form_hint, 'claims.additional_information.has_miscellaneous_information_hint'
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'claims.additional_information.yes' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            element :no, :form_labelled, 'claims.additional_information.no' do
              element :selector, :css, 'input[type="radio"]'
              def set(*args); selector.set(*args); end
            end
            def set(value)
              choose(factory_translate(value), name: 'additional_information[has_miscellaneous_information]')
            end
          end

          # Enter more detail about your claim.
          # @!method additional_information_miscellaneous_information
          #   A govuk text area component wrapping the input, label, hint etc.. for a text area
          #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
          section :additional_information_miscellaneous_information, govuk_component(:text_area), :govuk_text_area, :'simple_form.labels.additional_information.miscellaneous_information' do
            element :additonal_miscellaneous_information_hint, :form_hint, 'simple_form.hints.additional_information.miscellaneous_information', exact: false
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

        def has_correct_translation?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          expect(feedback_notice).to have_feedback_info
          #More about the claim
          expect(main_header).to have_page_header
          #Other important details
          expect(main_content).to have_other_important_details
          expect(main_content.other_important_details).to have_miscellaneous_information
          expect(main_content.other_important_details).to have_miscellaneous_information_hint
          expect(main_content.other_important_details).to have_yes
          expect(main_content.other_important_details).to have_no
          #Enter more details about your claim
          expect(main_content.additional_information_miscellaneous_information).to have_additonal_miscellaneous_information_hint
          #save and continue
          expect(main_content).to have_save_and_continue_button
          #Support links
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
          return if data.nil?
          main_content.other_important_details.set(data[:other_additional_information])
          if data[:other_important_details] != ''
            main_content.additional_information_miscellaneous_information.set data[:other_important_details]
          end
        end
      end
    end
  end
end
