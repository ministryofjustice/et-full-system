module EtFullSystem
  module Test
    module Pages
      def et1_new_claim_page
        EtFullSystem::Test::Et1::NewClaimPage.new
      end

      def et1_identification_page
        EtFullSystem::Test::Et1::IdentificationPage.new
      end

      def et1_claimant_details_page
        EtFullSystem::Test::Et1::ClaimantDetailsPage.new
      end

      def et1_group_claims_page
        EtFullSystem::Test::Et1::GroupClaimsPage.new
      end
    end
  end
end
