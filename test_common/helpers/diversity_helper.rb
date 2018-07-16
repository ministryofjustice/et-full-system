module EtFullSystem
  module Test
    module DiversityHelper
      def diversity_load_page
        diversity_pages.diversity_landing_page.load
        diversity_pages.diversity_landing_page.start_diversity
      end

      def diversity_answer_claim_type_page
        # diversity_pages.claim_type_page.set_for('Discrimination')
        diversity_pages.claim_type_page.save_and_continue
      end

      def diversity_answer_sexual_identity_page
        diversity_pages.sexual_identity_page.save_and_continue
      end

      def diveristy_answer_relationship_status_page
        diversity_pages.relationship_status_page.save_and_continue
      end

      def diveristy_answer_age_group_caring_responsibilties
        diversity_pages.age_group_caring_responsibilties.save_and_continue
      end

      def diversity_answer_religion_page
        diversity_pages.religion_page.save_and_continue
      end

      def diversity_answer_ethnic_group_page
        diversity_pages.ethnic_group_page.save_and_continue
      end

      def diversity_answer_health_page
        diversity_pages.health_page.save_and_continue
      end

      def diversity_answer_pregnancy_page
        diversity_pages.pregnancy_page.save_and_continue
      end

      def diversity_submit_form_page
        diversity_pages.submission_form_page.submit_form
      end

      def diversity_confirmation_page
        diversity_pages.confirmation_page.return_to_gov_uk
      end
    end
  end
end

