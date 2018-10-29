require_relative './base_page'
module EtFullSystem
  module Test
    module Et1
      class ClaimTypePage < BasePage
        include RSpec::Matchers
        #your feedback header
        section :feedback_notice, '.feedback-notice' do
          include ::EtFullSystem::Test::I18n
          element :language, :link_named, 'switch.language'
          element :welsh_link, :link_or_button, t('switch.language', locale: :en)
          element :english_link, :link_or_button, t('switch.language', locale: :cy)
          element :feedback_link, :paragraph, 'shared.feedback_link.feedback_statement_html'
        end
        #About the claim
        section :main_header, '.main-header' do
          element :page_header, :page_title, 'claims.claim_type.header', exact: false
        end
        section :main_content, '#content .main-section .main-content' do
          section :error_message, '#error-summary' do
            element :error_summary, :content_header, 'shared.error_notification.error_summary', exact: false
            element :default_message, :paragraph, 'shared.error_notification.default_message', exact: false
          end
          #What your claim is about
          element :about_claim, :content_header, 'claims.claim_type.claim_type'
          #Select at least one of the claim types below
          element :about_claim_info, :paragraph, 'claims.claim_type.claim_type_label'
          #Unfair dismissal
          section :unfair_dismissal, :legend_header, 'claims.claim_type.unfair_dismissal' do
            element :what_is_this, :summary_text, 'claims.claim_type.summary' do
              element :selector, :css, '.summary'
              delegate :set, to: :selector
            end
            element :unfair_dismissal_info, :paragraph, 'claims.claim_type.unfair_dismissal_summary_detail', exact: false
            element :unfair_dismissal_claim_type, :form_labelled, 'simple_form.labels.claim.is_unfair_dismissal' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
          end
          #Protective aware
          section :protective_award, :legend_header, 'claims.claim_type.protective_award' do
            element :what_is_this, :summary_text, 'claims.claim_type.summary' do
              element :selector, :css, '.summary'
              delegate :set, to: :selector
            end
            element :protective_award_info, :paragraph, 'claims.claim_type.protective_award_summary_detail', exact: false
            element :protective_award_claim_type, :form_labelled, 'simple_form.labels.claim.is_protective_award' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
          end
          #Discrimination
          section :discrimination, :legend_header, 'claims.claim_type.discrimination' do
            #Sex
            element :sex_including_equal_pay_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.sex_including_equal_pay' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Race
            element :race_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.race' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Pregnancy or maternity
            element :pregnancy_or_maternity_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.pregnancy_or_maternity' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Sexual orientation
            element :sexual_orientation_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.sexual_orientation' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Gender reassignment
            element :gender_reassignment_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.gender_reassignment' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Disability
            element :disability_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.disability' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Age
            element :age_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.age' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Religion or belief
            element :religion_or_belief_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.religion_or_belief' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Marriage or civil partnership
            element :marriage_or_civil_partnership_claim_type, :form_labelled, 'simple_form.options.claim_type.discrimination_claims.marriage_or_civil_partnership' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
          end
          #Pay
          section :pay, :legend_header, 'claims.claim_type.pay' do
            #Redundancy pay
            element :protective_award_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.redundancy' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Holiday pay
            element :holiday_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.holiday' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Other payments
            element :other_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.other' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Notice pay
            element :notice_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.notice' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
            #Arrears of pay
            element :arrears_claim_type, :form_labelled, 'simple_form.options.claim_type.pay_claims.arrears' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
          end
          #Other type of cliam (not shown above)
          section :other_type_of_claim, :legend_header, 'claims.claim_type.other_type' do
            #If you can’t see a good match for your claim or want to add a claim that doesn’t appear in the options above.
            element :other_type_of_claim_hint, :paragraph, 'simple_form.hints.claim_type.is_other_type_of_claim'
            #Other type of claim
            element :protective_award_claim_type, :form_labelled, 'simple_form.labels.claim_type.is_other_type_of_claim' do
              element :selector, :css, 'input[type="checkbox"]'
              delegate :set, to: :selector
            end
          end
          #Whistleblowing claim
          section :whistleblowing_claim, :legend_header, 'claims.claim_type.whistleblowing' do
            element :is_whistleblowing, :form_labelled, 'simple_form.labels.claim.is_whistleblowing'
            element :is_whistleblowing_hint , :form_hint, 'simple_form.hints.claim_type.is_whistleblowing'
            include ::EtFullSystem::Test::I18n
            element :yes, :form_labelled, 'claims.claim_type.yes' do
              element :selector, :css, 'input'
              delegate :set, to: :selector
            end
            element :no, :form_labelled, 'claims.claim_type.no' do
              element :selector, :css, 'input'
              delegate :set, to: :selector
            end
          end

          #Save and continue
          element :save_and_continue_button, :submit_text, 'helpers.submit.update', exact: false
          #Support links
          section :support, 'aside[role="complementary"]' do
            element :suport_header, :support_header, 'shared.aside.gethelp_header'
            element :guide, :link_named, 'shared.aside.read_guide'
            element :contact_use, :link_named, 'shared.aside.contact_us'
            element :your_claim, :support_header, 'shared.aside.actions_header'
            element :save_and_complete_later, :button, 'shared.mobile_nav.save_and_complete'
          end
        end

        def has_correct_translation?
          #your feedback header
          expect(feedback_notice).to have_language
          expect(feedback_notice).to have_feedback_link
          #About the claim
          expect(main_header).to have_page_header
          #What your claim is about
          expect(main_content).to have_about_claim
          #Select at least one of the claim types below
          expect(main_content).to have_about_claim_info
          #unfair_dismissal
          expect(main_content).to have_unfair_dismissal
          expect(main_content.unfair_dismissal).to have_what_is_this
          expect(main_content.unfair_dismissal).to have_unfair_dismissal_info
          expect(main_content.unfair_dismissal).to have_unfair_dismissal_claim_type
          #Protective award
          expect(main_content).to have_protective_award
          expect(main_content.protective_award).to have_what_is_this
          expect(main_content.protective_award).to have_protective_award_info
          expect(main_content.protective_award).to have_protective_award_claim_type
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
          expect(main_content.pay).to have_protective_award_claim_type
          expect(main_content.pay).to have_holiday_claim_type
          expect(main_content.pay).to have_other_claim_type
          expect(main_content.pay).to have_notice_claim_type
          expect(main_content.pay).to have_arrears_claim_type
          #Other type of cliam (not shown above)
          expect(main_content).to have_other_type_of_claim
          expect(main_content.other_type_of_claim).to have_other_type_of_claim_hint
          expect(main_content.other_type_of_claim).to have_protective_award_claim_type
          #Whistleblowing claim
          expect(main_content.whistleblowing_claim).to have_is_whistleblowing
          expect(main_content.whistleblowing_claim).to have_is_whistleblowing_hint
          expect(main_content.whistleblowing_claim).to have_yes
          expect(main_content.whistleblowing_claim).to have_no
        end

        def save_and_continue
          main_content.save_and_continue_button.click
        end

        def set(claim)
          data = claim.to_h
          return if claim.nil?
          set_field main_content, :claim_type, data
          set_field main_content, :whistleblowing_claim, data
          set_field main_content.whistleblowing_claim, :send_to_relevant_person, data
        end

        private

        def set_field(s, key, data)
          s.send(key).set(data[key]) if data.key?(key)
        end
      end
    end
  end
end
