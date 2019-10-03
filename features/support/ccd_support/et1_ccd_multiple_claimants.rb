require 'et_ccd_client'
require 'csv'
require_relative './base'
require_relative './et1_claimant_type'
require_relative './ccd_file_helper'

module EtFullSystem
  module Test
    module Ccd
      class Et1CcdMultipleClaimants < Base
        include ::EtFullSystem::Test::I18n
        include RSpec::Matchers
        include ::EtFullSystem::Test::Et1ClaimantType
        include ::EtFullSystem::Test::CcdFileHelper

        def initialize(response)
          self.response = response
        end

        def self.find_multiples_by_reference(reference_number, ccd_office, timeout: 60, sleep: 0.5)
          Timeout.timeout(timeout) do
            response = nil
            until response.present? do
              response = ccd.caseworker_search_latest_by_multiple_reference(reference_number, case_type_id: ccd_office)
              puts response
              sleep sleep unless response.present?
            end
            new(response)
          end
        rescue Timeout::Error
          return nil
        end

        def assert_multiple_reference(reference_number)
          expect(response['case_fields']).to include "multipleReference" => reference_number
        end

        def assert_multiple_title(title)
          expect(response['case_fields']).to include "bulkCaseTitle" => title
        end

        def assert_claimants_pending_status(ccd_office)
          case_collection = response.dig('case_fields', 'caseIdCollection').map { |obj| obj.dig('value', 'ethos_CaseReference') }
          aggregate_failures 'validating key fields' do
            case_collection.each do |ref|
              created_case = ccd.caseworker_search_latest_by_ethos_case_reference(ref, case_type_id: ccd_office)
              expect(created_case['case_fields']).to include 'state' => 'Pending'
            end
          end
        end

        def assert_primary_claimant(claimant, representative, employment, respondents, reference_number, ccd_office)
          case_references = response.dig('case_fields', 'caseIdCollection').map { |obj| obj.dig('value', 'ethos_CaseReference') }
          aggregate_failures 'validating key fields' do
            created_case = ccd.caseworker_search_latest_by_ethos_case_reference(case_references.first, case_type_id: ccd_office)

            expect(created_case['case_fields']).to include case_details(reference_number)
            expect(created_case['case_fields']).to include "claimantIndType" => a_hash_including(claimant_ind_type(claimant[0]).as_json)
            expect(created_case['case_fields']).to include "claimantType" => a_hash_including(claimant_type(claimant[0]).as_json)
            expect(created_case['case_fields']).to include "claimantType" => a_hash_including(claimant_type_address(claimant[0]).as_json)

            if representative[0]['representative_have'] == 'No'
              expect(created_case['case_fields']).to include "claimantRepresentedQuestion" => "No"
            else
              expect(created_case['case_fields']).to include "representativeClaimantType" => a_hash_including(representative_address(representative[0]).as_json)
              expect(created_case['case_fields']).to include "representativeClaimantType" => a_hash_including(representative_claimant_type(representative[0]).as_json)
            end

            if employment[:employment_details] == :"claims.employment.no"
              expect(created_case['case_fields']).to include "claimantOtherType" => a_hash_including("claimant_disabled" => t(claimants[0][:has_special_needs]), "claimant_disabled_details" => claimants[0][:special_needs])
            else
              expect(created_case['case_fields']).to include "claimantOtherType" => a_hash_including(claimant_other_type(employment, claimant).as_json)
            end

            expect(created_case['case_fields']).to include "claimantWorkAddress" => a_hash_including(claimant_work_address(respondents[0]).as_json)

            respondents.each_with_index do |respondent, i|
              expect(created_case['case_fields']['respondentCollection'][i]).to include "value" => a_hash_including(respondent_sum_type(respondent))
            end

          end
        end

        def find_pdf_file(ccd_office)
          case_references = response.dig('case_fields', 'caseIdCollection').first.dig('value', 'ethos_CaseReference')
          created_case = ccd.caseworker_search_latest_by_ethos_case_reference(case_references, case_type_id: ccd_office)
          download_file(created_case, 'pdf')
        end

        def find_rtf_file(ccd_office)
          case_references = response.dig('case_fields', 'caseIdCollection').first.dig('value', 'ethos_CaseReference')
          created_case = ccd.caseworker_search_latest_by_ethos_case_reference(case_references, case_type_id: ccd_office)
          download_file(created_case, 'rtf')
        end

        def find_csv_file(ccd_office)
          case_references = response.dig('case_fields', 'caseIdCollection').first.dig('value', 'ethos_CaseReference')
          created_case = ccd.caseworker_search_latest_by_ethos_case_reference(case_references, case_type_id: ccd_office)
          download_file(created_case, 'csv')
        end

        def multiple_claimants_xls(claimants)
          if claimants[0].dig(:group_claims_csv)
            filename = File.expand_path(File.join('test_common', 'fixtures', 'simple_user_with_csv_group_claims.csv'))
            data = []
            CSV.foreach(filename, :headers => true) do |csv_row|
              data << csv_row
            end
            return data
          end
        end

        def assert_secondary_xls_claimants(claimants, representative, employment, respondents, ccd_office)
          case_references = response.dig('case_fields', 'caseIdCollection').map { |obj| obj.dig('value', 'ethos_CaseReference') }
          secondary_claimants_left = multiple_claimants_xls(claimants)
          cases = case_references.map do |ref|
            ccd_case = ccd.caseworker_search_latest_by_ethos_case_reference(ref, case_type_id: ccd_office)
            ccd_case['case_fields']
          end

          primary_case = cases.first
          secondary_cases = cases.drop(1)

          secondary_cases.each do |secondary_case|
            claimant = secondary_claimants_left.find do |c|
              #claimant
              secondary_case["claimantIndType"] == claimant_csv_ind_type(c)
              secondary_case["claimantType"] == secondary_xls_claimant_type_address(c)
            end
            raise "validating claimant details: #{secondary_claimants_left}" if claimant.nil?
            secondary_claimants_left.delete(claimant)
            #representative
            secondary_case["representativeClaimantType"] == secondary_representative(representative[0])
            #employment
            secondary_case["claimantOtherType"] == {}
            #respondents
            respondents.drop(1).each_with_index do |respondent, i|
              expect(secondary_case['respondentCollection'][i]).to include "value" => a_hash_including(respondent_sum_type(respondent))
            end
          end
          expect(secondary_claimants_left).to be_empty
        end

        def assert_secondary_claimant(claimants, representative, employment, respondents, ccd_office)
          case_references = response.dig('case_fields', 'caseIdCollection').map { |obj| obj.dig('value', 'ethos_CaseReference') }
          secondary_claimants_left = claimants.drop(1)
          cases = case_references.map do |ref|
            ccd_case = ccd.caseworker_search_latest_by_ethos_case_reference(ref, case_type_id: ccd_office)
            ccd_case['case_fields']
          end
          secondary_cases = cases.drop(1)

          secondary_cases.each do |secondary_case|
            claimant = secondary_claimants_left.find do |c|
              #claimant
              secondary_case["claimantIndType"] == claimant_ind_type(c, secondary: true)
              secondary_case["claimantType"] == secondary_claimant_type_address(c, secondary: true)
            end
            raise "validating claimant details: #{secondary_claimants_left}" if claimant.nil?
            secondary_claimants_left.delete(claimant)
            #representative
            secondary_case["representativeClaimantType"] == secondary_representative(representative[0])
            #employment
            secondary_case["claimantOtherType"] == {}
            #respondents
            respondents.each_with_index do |respondent, i|
              expect(secondary_case['respondentCollection'][i]&.fetch('value', {})).to include respondent_sum_type(respondent)
            end

          end
          expect(secondary_claimants_left).to be_empty
        end

        private

        attr_accessor :response

        def case_details(reference_number)
          {
            "receiptDate" => Time.now.strftime("%Y-%m-%d"),
            "state" => "Pending",
            "stateAPI" => "Pending",
            "feeGroupReference" => reference_number,
            "claimant_TypeOfClaimant" => "Individual",
            "positionType" => "received by auto-import"
          }
        end

      end
    end
  end
end
