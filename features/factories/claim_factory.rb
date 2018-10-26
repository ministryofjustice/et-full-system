FactoryBot.define do
  factory :claim, class: OpenStruct do
    claim_type :"simple_form.labels.claim_type.is_unfair_dismissal"
    whistleblowing_claim 'Yes'
    send_to_relevant_person 'Yes'
    description 'Full text version of claim'
    other_claimants 'Yes'
    other_claimant_names 'Similar Claim1, Similar Claim2'
    preferred_outcome :"simple_form.options.claim.desired_outcomes.compensation_only"
    preferred_outcome_notes 'I would like 50,000 GBP due to the stress this caused me'
    other_important_details 'Here are some very important details that need to be considered'
  end

  trait :upload_your_claim_statement do
    rtf_file 'simple_user_with_rtf.rtf'
  end

end
