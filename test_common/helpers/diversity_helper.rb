module EtFullSystem
  module Test
    module DiversityHelper
      def load_diversity
        diversity_pages.diversity_landing_page.load
        diversity_pages.diversity_landing_page.start_diversity
      end

      def answer_claim_type
        diversity_pages.claim_type_page.set_for('Discrimination')
        diversity_pages.claim_type_page.save_and_continue
      end

      def answer_gender_page
      end

      def answer_gender_at_birth_page
      end

      def answer_sexual_identity_page
      end

      def answer_relationship_status_page
      end

      def answer_age_group_page
      end

      def answer_responsibilites_page
      end

      def answer_religion_page
      end
      
      def answer_ethnic_group_page
      end

      def answer_health_page
      end

      def answer_pregnancy_page
      end
    end
  end
end

