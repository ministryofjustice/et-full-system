require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimOutcomePage < BasePage
        include RSpec::Matchers
        #Claim outcome
        element :page_header, :page_title, 'claims.claim_outcome.header', exact: false
        section :main_content, '#main-content' do
          include EtTestHelpers::Section
          #What do you want if your claim is successful? (optional)
          # @!method claim_outcome
          #   A govuk collection of checkboxes component for claim_outcome question
          #   @return [EtTestHelpers::Components::GovUKCollectionCheckBoxes] The site prism section
          gds_checkboxes :claim_outcome, :'simple_form.labels.claim.desired_outcomes' do
            include EtTestHelpers::Section

            #Compensation
            element :compensation_only, :form_labelled, 'simple_form.options.claim_outcome.desired_outcomes.compensation_only' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #A recommendation from a tribunal (that the employer takes action so that the problem at work doesn’t happen again)
            element :tribunal_recommendation, :form_labelled, 'simple_form.options.claim_outcome.desired_outcomes.tribunal_recommendation' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #To get your old job back
            element :reinstated_employment_and_compensation, :form_labelled, 'simple_form.options.claim_outcome.desired_outcomes.reinstated_employment_and_compensation' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
            #To get another job with the same employer or associated employer
            element :new_employment_and_compensation, :form_labelled, 'simple_form.options.claim_outcome.desired_outcomes.new_employment_and_compensation' do
              element :selector, :css, 'input[type="checkbox"]'
              def set(*args); selector.set(*args); end
            end
          end

          # What compensation or other outcome do you want? (optional)
          # @!method claim_outcome_other_outcome
          #   A govuk text area component wrapping the input, label, hint etc.. for a text area
          #   @return [EtTestHelpers::Components::GovUKTextArea] The site prism section
          gds_text_area :claim_outcome_other_outcome, :'simple_form.labels.claim_outcome.other_outcome'

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
          #Claim outcome
          expect(self).to have_page_header
          #Choose your preferred outcome(s)
          expect(main_content).to have_claim_outcome
          ##What do you want if your claim is successful? (optional)
          expect(main_content.claim_outcome).to have_hint(text: t('simple_form.hints.claim_outcome.desired_outcomes'))
          expect(main_content.claim_outcome).to have_compensation_only
          expect(main_content.claim_outcome).to have_tribunal_recommendation
          expect(main_content.claim_outcome).to have_reinstated_employment_and_compensation
          expect(main_content.claim_outcome).to have_new_employment_and_compensation
          expect(main_content).to have_claim_outcome_other_outcome
          expect(main_content.claim_outcome_other_outcome).to have_hint(text: t('simple_form.hints.claim_outcome.other_outcome'))
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
          return if claim.nil? || claim.preferred_outcome.nil?
          claim.preferred_outcome.each do |preferred_outcome|
            section, element = map_preferred_outcome_section_element_from(preferred_outcome)
            main_content.send(section).send(element).click
          end
          data = claim.to_h
          main_content.claim_outcome_other_outcome.set(data[:preferred_outcome_notes])
        end
        
        def map_preferred_outcome_section_element_from(preferred_outcome)
          case preferred_outcome
            when :"simple_form.options.claim_outcome.desired_outcomes.compensation_only" then [:claim_outcome, :compensation_only]
            when :"simple_form.options.claim_outcome.desired_outcomes.tribunal_recommendation" then [:claim_outcome, :tribunal_recommendation]
            when :"simple_form.options.claim_outcome.desired_outcomes.reinstated_employment_and_compensation" then [:claim_outcome, :reinstated_employment_and_compensation]
            when :"simple_form.options.claim_outcome.desired_outcomes.new_employment_and_compensation" then [:claim_outcome, :new_employment_and_compensation]
          end
        end
      end
    end
  end
end
