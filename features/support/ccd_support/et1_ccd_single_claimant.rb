require 'httparty'
require 'et_ccd_client'
require_relative './base'
require_relative './acas_exemption_helper'
require_relative './et1_claimant_type'
require_relative './ccd_file_helper'

module EtFullSystem
  module Test
    module Ccd
      class Et1CcdSingleClaimant < Base
        include ::EtFullSystem::Test::I18n
        include RSpec::Matchers
        include ::EtFullSystem::Test::AcasExemptionHelper
        include ::EtFullSystem::Test::Et1ClaimantType
        include ::EtFullSystem::Test::CcdFileHelper


        def initialize(response)
          self.response = response
        end

        def self.find_latest(case_type_id, timeout: 10, sleep: 0.5)
          response = ccd.caseworker_list_cases(case_type_id: case_type_id).first
          return nil if response.nil?

          new(response)
        end

        def self.find_and_wait_for_latest(case_type_id, timeout: 10, sleep: 0.5)
          response = wait_for(timeout: timeout, sleep: sleep) do
            ccd.caseworker_list_cases(case_type_id: case_type_id).first
          end
          return nil if response.nil?

          new(response)
        end

        def self.find_by_reference(reference_number, ccd_office_lookup, timeout: 10, sleep: 0.5)
          Timeout.timeout(timeout) do
            response = nil
            until response.present? do
              response = ccd.caseworker_search_latest_by_reference(reference_number, case_type_id: ccd_office_lookup)
              sleep sleep unless response.present?
            end
            new(response)
          end
        rescue Timeout::Error
          return nil
        end

        def self.find_by_ethos_case_reference(reference_number, ccd_office_lookup, timeout: 10, sleep: 0.5)
          response = wait_for(timeout: timeout, sleep: sleep) do
            ccd.caseworker_search_latest_by_ethos_case_reference(reference_number, case_type_id: ccd_office_lookup)
          end
          return nil if response.nil?

          new(response)
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
            expect(response.dig('case_fields', 'representativeClaimantType')).to include representative_address(representative[0]).as_json
            expect(response.dig('case_fields', 'representativeClaimantType')).to include representative_claimant_type(representative[0]).as_json
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

        def assert_claimant_work_address(respondent)
          expect(response['case_fields']).to include "claimantWorkAddress" => a_hash_including(claimant_work_address(respondent).as_json)
        end

        def assert_respondents(respondents)
          respondents.each_with_index do |respondent, i|
            expect(response['case_fields']['respondentCollection'][i]).to include "value" => a_hash_including(respondent_sum_type(respondent))
          end
        end

        def assert_et3_documents(respondent)
          # First, wait for it to arrive - the app is going to add to the collection so we cant assume it
          # will be there when we check
          expect(response.dig('case_fields', 'documentCollection')).to \
            include \
            a_hash_including 'id' => nil,
            'value' => a_hash_including(
              'typeOfDocument' => 'ET3',
              'shortDescription' => "ET3 response from #{respondent.name}",
              'uploadedDocument' => a_hash_including(
                'document_url' => an_instance_of(String),
                'document_binary_url' => an_instance_of(String),
                'document_filename' => 'et3_atos_export.pdf'
              )
            )
        end

        def has_et3_documents?(respondent)
          assert_et3_documents(respondent)
          true
        rescue RSpec::Expectations::ExpectationNotMetError
          false
        end

        def find_pdf_file
          download_file(response, 'pdf')
        end

        def find_rtf_file
          download_file(response, 'rtf')
        end

        def ethos_case_reference
          response.dig('case_fields', 'ethosCaseReference')
        end

        private

        attr_accessor :response

        def case_details(case_fields)
          {
            "receiptDate" => Time.now.strftime("%Y-%m-%d"),
            "feeGroupReference" => case_fields,
            "claimant_TypeOfClaimant" => "Individual",
            "caseType" => "Single",
            "positionType" => "received by auto-import"
          }
        end

        def self.wait_for(timeout: 10, sleep: 1)
          Timeout.timeout(timeout) do
            response = nil
            until response.present? do
              response = yield
              sleep sleep unless response.present?
            end
            response
          end
        rescue Timeout::Error
          return nil
        end

        def wait_for(**args)
          self.class.wait_for(**args) do
            yield
          end
        end

      end
    end
  end
end
