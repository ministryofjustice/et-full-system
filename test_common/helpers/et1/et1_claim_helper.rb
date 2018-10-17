module EtFullSystem
  module Test
    module Et1ClaimHelper
      def start_a_new_et1_claim
        load_start_page
        et1_apply_page.start_a_claim
      end

      def load_start_page(in_language: ::EtFullSystem::Test::Messaging.instance.current_locale)
        et1_apply_page.load
        case in_language
        when :cy then et1_apply_page.switch_to_welsh
        when :en then nil
        else raise "We only support languages en and cy - #{in_language} is not supported"
        end
      end

      def et1_answer_login
        et1_application_number_page.set(@claimant)
        et1_application_number_page.save_and_continue
      end

      def et1_answer_claimant_questions
        et1_claimant_details_page.main_content.title.set(@claimant[:title])
        et1_claimant_details_page.main_content.first_name.set(@claimant[:first_name])
        et1_claimant_details_page.main_content.last_name.set(@claimant[:last_name])
        et1_claimant_details_page.main_content.date_of_birth.set(@claimant[:date_of_birth])
        et1_claimant_details_page.main_content.gender.set(@claimant[:gender])
        et1_claimant_details_page.main_content.claiman_has_special_needs.set(@claimant[:has_special_needs])
        et1_claimant_details_page.main_content.assistance.special_needs.set(@claimant[:special_needs])
        et1_claimant_details_page.main_content.building.set(@claimant[:building])
        et1_claimant_details_page.main_content.street.set(@claimant[:street])
        et1_claimant_details_page.main_content.locality.set(@claimant[:locality])
        et1_claimant_details_page.main_content.county.set(@claimant[:county])
        et1_claimant_details_page.main_content.post_code.set(@claimant[:post_code])
        et1_claimant_details_page.main_content.country.set(@claimant[:country])
        et1_claimant_details_page.main_content.telephone_number.set(@claimant[:telephone_number])
        et1_claimant_details_page.main_content.alternative_telephone_number.set(@claimant[:alternative_telephone_number])
        et1_claimant_details_page.main_content.email_address.set(@claimant[:email_address])
        et1_claimant_details_page.main_content.claimant_contact_preference.set(@claimant[:claimant_contact_preference])
        et1_claimant_details_page.save_and_continue
      end

      def et1_answer_group_claimants_questions
        et1_group_claims_page.set_for(@claimants)
        group_claims_csv = @claimants[0].dig(:group_claims_csv)
        if group_claims_csv
          et1_group_claims_upload_page.set_for(@claimants)
          et1_group_claims_upload_page.save_and_continue
        else
          et1_group_claims_page.save_and_continue
        end
      end

      def et1_answer_representatives_questions
        et1_representatives_details_page.set_for(@representative)
        et1_representatives_details_page.save_and_continue
      end

      def et1_answer_respondents_questions
        et1_respondents_details_page.set_for(@respondents)
        et1_respondents_details_page.save_and_continue
        et1_additional_respondents_details_page.set_for(@respondents)
        et1_additional_respondents_details_page.save_and_continue
      end

      def et1_answer_employment_details_questions
        et1_employment_details_page.set_for(@employment)
        et1_employment_details_page.save_and_continue
      end

      def et1_answer_claim_type_questions
        et1_claim_type_page.set_for(@claim)
        et1_claim_type_page.save_and_continue
      end

      def et1_answer_claim_details_questions
        et1_claim_details_page.set_for(@claim)
        et1_claim_details_page.save_and_continue
      end

      def et1_answer_claim_outcome_questions
        et1_claim_outcome_page.set_for(@claim)
        et1_claim_outcome_page.save_and_continue
      end

      def et1_answer_more_about_the_claim_questions
        et1_more_about_the_claim_page.set_for(@claim)
        et1_more_about_the_claim_page.save_and_continue
      end

      def et1_submit_claim
        et1_submission_page.submit_claim
      end

      def et1_submit_your_feedback
        et1_your_feedback_page.main_content.comments.set('feedback page has no validation')
        et1_your_feedback_page.main_content.suggestions.set("Don't understand why user is allowed to submit blank page")
        et1_your_feedback_page.main_content.email_address.set('no validating here either')
        et1_your_feedback_page.send_your_feedback
      end
    end
  end
end

