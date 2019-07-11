require 'et_ccd_client'
require_relative './base'
require_relative './acas_exemption_helper'

module EtFullSystem
  module Test
    module Ccd
      class Et1CcdJsonObject < Base
        include ::EtFullSystem::Test::I18n
        include RSpec::Matchers
        include ::EtFullSystem::Test::AcasExemptionHelper
  
        def initialize(response)
          self.response = response
        end
  
        def self.find_by_reference(reference_number, timeout: 10, sleep: 0.1)
          ccd = ::EtCcdClient::UiClient.new
          ccd.login(username: 'm@m.com', password: 'p')
          
          Timeout.timeout(timeout) do
            response = nil
            until response.present? do
              response = ccd.caseworker_search_latest_by_reference(reference_number, case_type_id: 'EmpTrib_MVP_1.0_Manc')
              sleep sleep unless response.present?
            end
            new(response)
          rescue Timeout::Error
            return nil
          end
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

        def assert_primary_employment(employment)
          if employment[:employment_details] == :"claims.employment.no"
            expect(response['case_fields']).to include "claimantOtherType" => a_hash_including("claimant_disabled" => "No")
          else
            expect(response['case_fields']).to include "claimantOtherType" => a_hash_including(claimant_other_type(employment).as_json)
          end
        end

        def assert_primary_respondent(respondent)
          expect(response['case_fields']).to include "claimantWorkAddress" => a_hash_including(claimant_work_address(respondent).as_json)
          expect(response['case_fields']).to include "respondentSumType" => a_hash_including(respondent_sum_type(respondent).as_json)
        end

        def assert_secondary_respondents(respondents)
          respondents.each_with_index do |respondent, i|
            expect(response['case_fields']['respondentCollection'][i]).to include "value" => a_hash_including(respondent_sum_type(respondent, secondary: true).as_json)
          end
        end

        private

        attr_accessor :response

        def claimant_type(claimant)
          {
            "claimant_phone_number" => claimant[:telephone_number],
            "claimant_mobile_number" => claimant[:alternative_telephone_number],
            "claimant_email_address" => claimant[:email_address],
            "claimant_contact_preference" => claimant[:correspondence].to_s.split(".").last.titleize
          } 
        end

        def claimant_type_address(claimant)
          {
            "claimant_addressUK" => {
              "County" => claimant[:county],
              "Country" => claimant[:country].to_s.split(".").last == "united_kingdom" ? "United Kingdom" : nil,
              "PostCode" => claimant[:post_code],
              "PostTown" => claimant[:locality],
              "AddressLine1" => claimant[:building],
              "AddressLine2" => claimant[:street]
              }
          }
        end

        def claimant_ind_type(claimant)
          {
            "claimant_title1" => t(claimant[:title]), 
            "claimant_first_names" => claimant[:first_name], 
            "claimant_last_name" => claimant[:last_name], 
            "claimant_date_of_birth" => Date.parse(claimant[:date_of_birth]).strftime("%Y-%m-%d"),
            "claimant_gender" => claimant[:gender].to_s.split(".").last == "prefer_not_to_say" ? "N/K" : t(claimant[:gender])
          }
        end

        def representative_address(representative)
          {
            "representative_address" => {
              "County" => representative[:county],
              "PostCode" => representative[:post_code],
              "PostTown" => representative[:locality],
              "AddressLine1" => representative[:building],
              "AddressLine2" => representative[:street]
            }
          }
        end

        def representative_claimant_type(representative)
          {
            "representative_dx" => representative[:dx_number],
            "name_of_organisation" => representative[:organisation_name],
            "name_of_representative" => representative[:name],
            "representative_occupation" => t(representative[:type]),
            "representative_phone_number" => representative[:telephone_number],
            "representative_email_address" => representative[:email_address],
            "representative_mobile_number" => representative[:alternative_telephone_number]
          }
        end

        def case_details(case_fields)
          {
            "receiptDate" => Time.now.strftime("%Y-%m-%d"),
            "feeGroupReference" => case_fields,
            "claimant_TypeOfClaimant" => "Individual",
            "caseType" => "Single"
          }
        end

        def claimant_other_type(employment)
          if currently_employed?(employment)
            {
              "claimant_disabled" => "No",
              "claimant_employed_currently" => "Yes", 
              "claimant_occupation" => employment[:job_title],
              "claimant_employed_from" => Date.parse(employment[:start_date]).strftime("%Y-%m-%d"),
              "claimant_employed_to" => nil,
              "claimant_employed_notice_period" => nil
            }
          elsif working_noticed_period?(employment)
            {
              "claimant_disabled" => "No",
              "claimant_employed_currently" => "Yes", 
              "claimant_occupation" => employment[:job_title],
              "claimant_employed_from" => Date.parse(employment[:start_date]).strftime("%Y-%m-%d"),
              "claimant_employed_to" => nil,
              "claimant_employed_notice_period" => Date.parse(employment[:notice_period_end_date]).strftime("%Y-%m-%d")
            }
          else employment_terminated?(employment)
            {
              "claimant_disabled" => "No",
              "claimant_employed_currently" => "Yes", 
              "claimant_occupation" => employment[:job_title],
              "claimant_employed_from" => Date.parse(employment[:start_date]).strftime("%Y-%m-%d"),
              "claimant_employed_to" => Date.parse(employment[:end_date]).strftime("%Y-%m-%d"),
              "claimant_employed_notice_period" => nil
            }
          end
        end

        def working_noticed_period?(employment)
          employment[:notice_period_end_date] != ''
        end

        def currently_employed?(employment)
          employment[:notice_period_end_date] == '' && employment[:end_date] == ''
        end

        def employment_terminated?(employment)
          employment[:end_date] != ''
        end

        def claimant_work_address(respondent)
          if respondent[:work_county] == nil
            {
              "claimant_work_address" => {
                "County" => respondent[:county],
                "PostCode" => respondent[:post_code],
                "PostTown" => respondent[:locality],
                "AddressLine1" => respondent[:building],
                "AddressLine2" => respondent[:street]
              },
              "claimant_work_phone_number" => respondent[:telephone_number]
            }
          else
            {
              "claimant_work_address" => {
                "County" => respondent[:work_county],
                "PostCode" => respondent[:work_post_code],
                "PostTown" => respondent[:work_locality],
                "AddressLine1" => respondent[:work_building],
                "AddressLine2" => respondent[:work_street]
              },
              "claimant_work_phone_number" => respondent[:work_telephone_number]
            }
          end
        end

        def respondent_sum_type(respondent, secondary: false)
          if acas_number?(respondent)
            {
              "respondent_ACAS" => respondent[:acas_number],
              "respondent_name" => respondent[:name],
              "respondent_phone1" => secondary ? nil : respondent[:telephone_number],
              "respondent_address" => {
                "County" => respondent[:county],
                "PostCode" => respondent[:post_code],
                "PostTown" =>respondent[:locality],
                "AddressLine1" => respondent[:building],
                "AddressLine2" => respondent[:street]
              },
              "respondent_ACAS_question"=>"Yes"
            }
          else
            {
              "respondent_name" => respondent[:name],
              "respondent_ACAS_question" => "No",
              "respondent_address" => 
                {
                  "County" => respondent[:county],
                  "PostCode" => respondent[:post_code],
                  "PostTown" =>respondent[:locality],
                  "AddressLine1" => respondent[:building],
                  "AddressLine2" => respondent[:street]
                },
              "respondent_phone1" => secondary ? nil : respondent[:telephone_number],
              "respondent_ACAS" => nil,
              "respondent_ACAS_no" => acas_exemption(respondent[:no_acas_number_reason].to_s.split(".").last)
            }
          end
        end

        def acas_number?(respondent)
          respondent[:acas_number] != nil
        end
  
      end
    end
  end
end