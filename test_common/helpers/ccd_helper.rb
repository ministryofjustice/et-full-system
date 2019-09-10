module EtFullSystem
  module Test
    module CcdHelper
      def ccd
        return @ccd if defined?(@ccd)
        @ccd = ::EtCcdClient::UiClient.new
        @ccd.login(username: ::EtFullSystem::Test::Configuration.ccd_sidam_username, password: ::EtFullSystem::Test::Configuration.ccd_sidam_password)
        @ccd
      end

      def find_or_create_any_claim_in_ccd
        ccd_object = EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_latest(settings.ccd_case_type_ids.manchester.single)
        return ccd_object unless ccd_object.nil? || ccd_object.ethos_case_reference.nil? || ccd_object.ethos_case_reference !=~ /\A\d\d\d\d\d\d\d\/\d\d\d\d\z/

        @claimant = FactoryBot.create_list(:claimant, 1, :person_data)
        @representative = FactoryBot.create_list(:representative, 1, :et1_information)
        @respondent = FactoryBot.create_list(:conciliation_acas_number, 1, :yes_acas, work_post_code: 'M1 1AQ', expected_office: 24)
        @employment = FactoryBot.create(:employment, :still_employed)
        @claim = FactoryBot.create(:claim, :yes_to_whistleblowing_claim)
        start_a_new_et1_claim
        @claim_number = et1_application_number_page.main_content.claims_number.text
        et1_answer_login
        et1_answer_claimant_questions
        et1_answer_group_claimants_questions
        et1_answer_representatives_questions
        et1_answer_respondents_questions
        et1_answer_employment_details_questions
        et1_answer_claim_type_questions
        et1_answer_claim_details_questions
        et1_answer_claim_outcome_questions
        et1_answer_more_about_the_claim_questions
        et1_submit_claim
        EtFullSystem::Test::Ccd::Et1CcdSingleClaimant.find_and_wait_for_latest(settings.ccd_case_type_ids.manchester.single).tap do |result|
          raise "No claims were present in CCD and for some reason one could not be created - suggests a problem with the app or maybe a wrong office code" if result.nil?
        end
      end
    end
  end
end
