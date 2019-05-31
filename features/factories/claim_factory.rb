FactoryBot.define do
  factory :claim, class: OpenStruct do
    claim_types [:"simple_form.labels.claim_type.is_unfair_dismissal",
      :"simple_form.labels.claim_type.is_protective_award",
      :"simple_form.options.claim_type.discrimination_claims.sex_including_equal_pay",
      :"simple_form.options.claim_type.discrimination_claims.race",
      :"simple_form.options.claim_type.discrimination_claims.pregnancy_or_maternity",
      :"simple_form.options.claim_type.discrimination_claims.sexual_orientation",
      :"simple_form.options.claim_type.discrimination_claims.gender_reassignment",
      :"simple_form.options.claim_type.discrimination_claims.disability",
      :"simple_form.options.claim_type.discrimination_claims.age",
      :"simple_form.options.claim_type.discrimination_claims.religion_or_belief",
      :"simple_form.options.claim_type.discrimination_claims.marriage_or_civil_partnership",
      :"simple_form.options.claim_type.pay_claims.redundancy",
      :"simple_form.options.claim_type.pay_claims.holiday",
      :"simple_form.options.claim_type.pay_claims.other",
      :"simple_form.options.claim_type.pay_claims.notice",
      :"simple_form.options.claim_type.pay_claims.arrears",
      :"simple_form.labels.claim_type.is_other_type_of_claim"]
    other_type_of_claim_details 'Give a very short description of your claim; you will have the opportunity to add more detail on the next page'
    description 'Full text version of claim'
    preferred_outcome [:"simple_form.options.claim_outcome.desired_outcomes.compensation_only",
      :"simple_form.options.claim_outcome.desired_outcomes.tribunal_recommendation",
      :"simple_form.options.claim_outcome.desired_outcomes.reinstated_employment_and_compensation",
      :"simple_form.options.claim_outcome.desired_outcomes.new_employment_and_compensation"]
    preferred_outcome_notes 'I would like 50,000 GBP due to the stress this caused me'
    other_important_details 'Here are some very important details that need to be considered'
  end

  trait :upload_your_claim_statement do
    whistleblowing_claim :"claims.claim_type.yes"
    send_to_relevant_person :"simple_form.yes"
    other_claimants :"claims.claim_type.yes"
    other_claimant_names 'Similar Claim1, Similar Claim2'
    rtf_file 'simple_user_with_rtf.rtf'
  end

  trait :no_to_other_claimants do
    whistleblowing_claim :"claims.claim_type.no"
    other_claimants :"claims.claim_type.no"
    other_claimant_names ''
  end

  trait :no_to_whistleblowing_claim do
    whistleblowing_claim :"claims.claim_type.no"
    other_claimants :"claims.claim_type.yes"
    other_claimant_names 'Similar Claim1, Similar Claim2'
  end

  trait :yes_to_whistleblowing_claim do
    whistleblowing_claim :"claims.claim_type.yes"
    send_to_relevant_person :"simple_form.yes"
    other_claimants :"claims.claim_type.yes"
    other_claimant_names 'Similar Claim1, Similar Claim2'
  end

end