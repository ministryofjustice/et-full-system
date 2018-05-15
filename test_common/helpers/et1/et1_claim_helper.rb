module EtFullSystem
  module Test
    module Et1ClaimHelper
      def start_a_new_et1_claim
        et1_new_claim_page.load
        et1_new_claim_page.start_a_claim
      end

      def et1_answer_login
        et1_identification_page.set_for(@claimant)
        et1_identification_page.save_and_continue
      end

      def et1_answer_claimant_questions
        et1_claimant_details_page.set_for(@claimant)
        et1_claimant_details_page.save_and_continue
      end

      def et1_answer_group_claimants_questions
        et1_group_claims_page.set_for(@group_claims)
        group_claims_csv = @claimant.dig(:group_claims_csv)
        if group_claims_csv
          et1_group_claims_upload_page.set_for(@claimant)
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
        et1_respondents_details_page.set_for(@respondent)
        et1_respondents_details_page.save_and_continue
        et1_additional_respondents_details_page.set_for(@respondent)
        et1_additional_respondents_details_page.save_and_continue
      end

      def et1_answer_employment_details_questions
        et1_employment_details_page.set_for(@employment)
        et1_employment_details_page.save_and_continue
      end

      def et1_answer_claim_type_questions
        et1_claim_type_page.set_for(@employment)
        et1_claim_type_page.save_and_continue
      end

      def et1_answer_claim_details_questions
        et1_claim_details_page.set_for(@employment)
        et1_claim_details_page.save_and_continue
      end

      def et1_answer_claim_outcome_questions
        et1_claim_outcome_page.set_for(@employment)
        et1_claim_outcome_page.save_and_continue
      end

      def et1_answer_more_about_the_claim_questions
        et1_more_about_the_claim_page.set_for(@employment)
        et1_more_about_the_claim_page.save_and_continue
      end

      def et1_submit_claim
        et1_submission_page.submit_claim
      end
    end
  end
end

