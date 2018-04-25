require_relative './admin_pages'
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

      def et1_group_claims_upload_page
        EtFullSystem::Test::Et1::GroupClaimsUploadPage.new
      end

      def et1_representatives_details_page
        EtFullSystem::Test::Et1::RepresentativesDetailsPage.new
      end

      def et1_respondents_details_page
        EtFullSystem::Test::Et1::RespondentsDetailsPage.new
      end

      def et1_additional_respondents_details_page
        EtFullSystem::Test::Et1::AdditionalRespondentsDetailsPage.new
      end

      def et1_employment_details_page
        EtFullSystem::Test::Et1::EmploymentDetailsPage.new
      end

      def et1_claim_type_page
        EtFullSystem::Test::Et1::ClaimTypePage.new
      end

      def et1_claim_details_page
        EtFullSystem::Test::Et1::ClaimDetailsPage.new
      end

      def et1_claim_outcome_page
        EtFullSystem::Test::Et1::ClaimOutcomePage.new
      end

      def et1_more_about_the_claim_page
        EtFullSystem::Test::Et1::MoreAboutTheClaimPage.new
      end

      def et1_submission_page
        EtFullSystem::Test::Et1::SubmissionPage.new
      end

      def admin_pages
        @admin_pages = AdminPages
      end

    end
  end
end
