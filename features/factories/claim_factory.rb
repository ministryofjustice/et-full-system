FactoryBot.define do
  factory :claim, class: OpenStruct do
    claim_types do
      [:"simple_form.labels.claim_type.is_unfair_dismissal",
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
    end
    other_type_of_claim_details {'Give a very short description of your claim; you will have the opportunity to add more detail on the next page'}
    description {'Full text version of claim'}

    trait :simple do
      claim_types { [:"simple_form.labels.claim_type.is_unfair_dismissal"] }
      other_type_of_claim_details { nil }
    end
  end

  trait :upload_your_claim_statement do
    preferred_outcome do
      [:"compensation_only",
      :"tribunal_recommendation",
      :"reinstated_employment_and_compensation",
      :"new_employment_and_compensation"]
    end
    preferred_outcome_notes {'I would like 50,000 GBP due to the stress this caused me'}
    whistleblowing_claim {:"claims.claim_type.yes"}
    send_to_relevant_person {:"simple_form.yes"}
    similar_claims {:"claims.claim_type.yes"}
    add_other_claimants {'Jimmy Barnes, Bryon Adams, Shelly Temple, Doris Day'}
    other_claimant_names {'Similar Claim1, Similar Claim2'}
    rtf_file {'simple_user_with_rtf.rtf'}
    other_additional_information {:'claims.additional_information.yes'}
    other_important_details {'Here are some very important details that need to be considered'}
  end

  trait :no_to_other_claimants do
    preferred_outcome do
      [:compensation_only,
      :tribunal_recommendation,
      :reinstated_employment_and_compensation,
      :new_employment_and_compensation]
    end
    preferred_outcome_notes {'I would like 50,000 GBP due to the stress this caused me'}
    whistleblowing_claim {:"claims.claim_type.no"}
    similar_claims {:"claims.claim_type.yes"}
    other_claimant_names {'James Blunt, Punky Brewsters, Shirly Temple'}
    other_additional_information {:'claims.additional_information.yes'}
    other_important_details {'Here are some very important details that need to be considered'}
  end

  trait :no_to_whistleblowing_claim do
    preferred_outcome do
      [:compensation_only,
      :tribunal_recommendation,
      :reinstated_employment_and_compensation,
      :new_employment_and_compensation]
    end
    preferred_outcome_notes {'I would like 50,000 GBP due to the stress this caused me'}
    whistleblowing_claim {:"claims.claim_type.no"}
    similar_claims {:"claims.claim_type.yes"}
    other_claimant_names {'Jimmy Barnes, Bryon Adams, Shelly Temple, Doris Day'}
    other_additional_information {:'claims.additional_information.yes'}
    other_important_details {'Here are some very important details that need to be considered'}
  end

  trait :yes_to_whistleblowing_claim do
    preferred_outcome do
      [:compensation_only,
      :tribunal_recommendation,
      :reinstated_employment_and_compensation,
      :new_employment_and_compensation]
    end
    preferred_outcome_notes {'I would like 50,000 GBP due to the stress this caused me'}
    whistleblowing_claim {:"claims.claim_type.yes"}
    send_to_relevant_person {:"simple_form.yes"}
    similar_claims {:"claims.claim_type.yes"}
    other_claimant_names {'James Blunt, Punky Brewsters, Shirly Temple'}
    other_additional_information {:'claims.additional_information.yes'}
    other_important_details {'Here are some very important details that need to be considered'}
  end

  trait :no_to_multiple_claims do
    preferred_outcome do
      [:compensation_only,
      :tribunal_recommendation,
      :reinstated_employment_and_compensation,
      :new_employment_and_compensation]
    end
    preferred_outcome_notes {'I would like 50,000 GBP due to the stress this caused me'}
    whistleblowing_claim {:"claims.claim_type.yes"}
    send_to_relevant_person {:"simple_form.yes"}
    similar_claims {:"claims.claim_type.no"}
    other_claimant_names {''}
    other_additional_information {:'claims.additional_information.yes'}
    other_important_details {'Here are some very important details that need to be considered'}
  end

  trait :nil_to_claim_outcome do
    preferred_outcome {[]}
    preferred_outcome_notes {''}
    whistleblowing_claim {:"claims.claim_type.yes"}
    send_to_relevant_person {:"simple_form.yes"}
    similar_claims {:"claims.claim_type.no"}
    other_claimant_names {''}
    other_additional_information {:'claims.additional_information.yes'}
    other_important_details {'Here are some very important details that need to be considered'}
  end

  trait :no_to_other_important_details do
    preferred_outcome do
      [:compensation_only,
      :tribunal_recommendation,
      :reinstated_employment_and_compensation,
      :new_employment_and_compensation]
    end
    preferred_outcome_notes {''}
    whistleblowing_claim {:"claims.claim_type.yes"}
    send_to_relevant_person {:"simple_form.yes"}
    similar_claims {:"claims.claim_type.no"}
    other_claimant_names {''}
    other_additional_information {:'claims.additional_information.no'}
    other_important_details {''}
  end
end
