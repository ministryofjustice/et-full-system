module EtFullSystem
  module Test
    module Et1ClaimHelper
      def start_a_new_et1_claim
        et1_new_claim_page.load
        et1_new_claim_page.start_a_claim
      end

      def et1_answer_login
        et1_identification_page.set_for(user)
        et1_identification_page.save_and_continue
      end

      def et1_answer_claimant_questions
        et1_claimant_details_page.set_for(user)
        et1_claimant_details_page.save_and_continue
      end

      def et1_answer_group_claimants_questions
        et1_group_claims_page.set_for(user)
        et1_group_claims_page.save_and_continue
      end

      def et1_answer_representatives_questions
        et1_representatives_details_page.set_for(user)
        et1_representatives_details_page.save_and_continue
      end
    end
  end
end

RSpec.configure do |c|
  c.include EtFullSystem::Test::Et1ClaimHelper, type: :feature
end