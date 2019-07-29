require 'et_ccd_client'
require_relative './base'
require_relative './acas_exemption_helper'
require_relative './et1_claimant_type'

module EtFullSystem
  module Test
    module Ccd
      class Et1CcdSingleClaimant < Base
        include ::EtFullSystem::Test::I18n
        include RSpec::Matchers
        include ::EtFullSystem::Test::AcasExemptionHelper
        include ::EtFullSystem::Test::Et1ClaimantType

  
        def initialize(response)
          self.response = response
        end
  
        def self.find_by_reference(reference_number, timeout: 10, sleep: 0.1)
          Timeout.timeout(timeout) do
            response = nil
            until response.present? do
              response = ccd.caseworker_search_latest_by_reference(reference_number, case_type_id: 'EmpTrib_MVP_1.0_Manc')
              sleep sleep unless response.present?
            end
            new(response)
          end
        rescue Timeout::Error
          return nil
        end

        def assert_primary_claimants(claimants)
          expect(response['case_fields']).to include "claimantType" => a_hash_including(claimant_type(claimants[0]).as_json)
          expect(response['case_fields']).to include "claimantType" => a_hash_including(claimant_type_address(claimants[0]).as_json)
          expect(response['case_fields']).to include "claimantIndType" => a_hash_including(claimant_ind_type(claimants[0]).as_json)
        end

        def assert_primary_representative(representative)
          if representative[0]['representative_have'] == 'No'
            expect(response['case_fields']).to include "claimantRepresentedQuestion" => "No"
          else
            expect(response['case_fields']).to include "representativeClaimantType" => a_hash_including(representative_address(representative[0]).as_json)
            expect(response['case_fields']).to include "representativeClaimantType" => a_hash_including(representative_claimant_type(representative[0]).as_json)
          end
        end

        def assert_primary_reference(case_fields)
          expect(response['case_fields']).to include case_details(case_fields)
        end

        def assert_primary_employment(employment, claimants)
          if employment[:employment_details] == :"claims.employment.no"
            expect(response['case_fields']).to include "claimantOtherType" => a_hash_including("claimant_disabled" => t(claimants[0][:has_special_needs]), "claimant_disabled_details" => claimants[0][:special_needs])
          else
            expect(response['case_fields']).to include "claimantOtherType" => a_hash_including(claimant_other_type(employment, claimants).as_json)
          end
        end

        def assert_primary_respondent(respondent)
          expect(response['case_fields']).to include "claimantWorkAddress" => a_hash_including(claimant_work_address(respondent).as_json)
          expect(response['case_fields']).to include "respondentSumType" => a_hash_including(respondent_sum_type(respondent).as_json)
        end

        def assert_secondary_respondents(respondents)
          respondents.drop(1).each_with_index do |respondent, i|
            binding.pry
            expect(response['case_fields']['respondentCollection'][i]).to include "value" => a_hash_including(respondent_sum_type(respondent))
          end
        end

        private

        attr_accessor :response

        def case_details(case_fields)
          {
            "receiptDate" => Time.now.strftime("%Y-%m-%d"),
            "feeGroupReference" => case_fields,
            "claimant_TypeOfClaimant" => "Individual",
            "caseType" => "Single"
          }
        end
  
      end
    end
  end
end