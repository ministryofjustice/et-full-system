require 'faker'

FactoryBot.define do
  factory :et3_claimant, class: OpenStruct do
      # Claimants Details
      claimants_name { Faker::Name.name }
      agree_with_early_conciliation_details 'No'
      disagree_conciliation_reason 'lorem ipsum conciliation'
      agree_with_employment_dates 'No'
      employment_start '01/01/2017'
      employment_end '31/12/2017'
      disagree_employment 'lorem ipsum employment'
      continued_employment 'No'
      agree_with_claimants_description_of_job_or_title 'No'
      disagree_claimants_job_or_title 'lorem ipsum job title'
      agree_with_claimants_hours 'No'
      queried_hours 32.0
      agree_with_earnings_details 'No'
      queried_pay_before_tax 1000.0
      queried_pay_before_tax_period 'Monthly'
      queried_take_home_pay 900.0
      queried_take_home_pay_period 'Monthly'
      agree_with_claimant_notice 'No'
      disagree_claimant_notice_reason 'lorem ipsum notice reason'
      agree_with_claimant_pension_benefits 'No'
      disagree_claimant_pension_benefits_reason 'lorem ipsum claimant pension'
      defend_claim 'Yes'
      defend_claim_facts 'lorem ipsum defence'
  end
end

