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

      def et1_claim_submitted
        EtFullSystem::Test::Et1::ClaimSubmitted.new
      end

      def start_page
        EtFullSystem::Test::Et3::StartPage.new
      end

      def respondents_details_page
        EtFullSystem::Test::Et3::RespondentsDetailsPage.new
      end

      def claimants_details_page
        EtFullSystem::Test::Et3::ClaimantsDetailsPage.new
      end

      def earnings_and_benefits_page
        EtFullSystem::Test::Et3::EarningsAndBenefitsPage.new
      end

      def response_page
        EtFullSystem::Test::Et3::ResponsePage.new
      end

      def your_representative_page
        EtFullSystem::Test::Et3::YourRepresentativePage.new
      end

      def disability_page
        EtFullSystem::Test::Et3::DisabilityPage.new
      end

      def your_representatives_details_page
        EtFullSystem::Test::Et3::YourRepresentativesDetailsPage.new
      end

      def employers_contract_claim_page
        EtFullSystem::Test::Et3::EmployersContractClaimPage.new
      end

      def additional_information_page
        EtFullSystem::Test::Et3::AdditionalInformationPage.new
      end

      def confirmation_of_supplied_details_page
        EtFullSystem::Test::Et3::ConfirmationOfSuppliedDetailsPage.new
      end

      def form_submission_page
        EtFullSystem::Test::Et3::FormSubmissionPage.new
      end

      def admin_pages
        @admin_pages = AdminPages
      end

      def diversity_pages
        @diversity_pages = DiversityPages
      end

    end
  end
end
