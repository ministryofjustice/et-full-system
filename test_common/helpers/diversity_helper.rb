module EtFullSystem
  module Test
    module DiversityHelper
      def diversity_load_page
        diversity_pages.diversity_landing_page.load
        diversity_pages.diversity_landing_page.start_diversity
      end

      def answer_diversity_page(answers)
        diversity_pages.claim_type_page.set_for(answers)
        diversity_pages.sexual_identity_page.set_for(answers)
        diversity_pages.relationship_status_page.set_for(answers)
        diversity_pages.age_group_caring_responsibilities_page.set_for(answers)
        diversity_pages.religion_page.set_for(answers)
        diversity_pages.ethnic_group_page.set_for(answers)
        diversity_pages.health_page.set_for(answers)
        diversity_pages.pregnancy_page.set_for(answers)
      end

      def diversity_submit_form
        diversity_pages.submission_form_page.submit_form
      end

      def return_to_gov_uk
        diversity_pages.confirmation_page.return_to_gov_uk
      end
    end
  end
end

