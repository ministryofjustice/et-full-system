FactoryBot.define do
  factory :diversity, class: OpenStruct do
    trait :not_blank do
      claim_type 'Unfair dismissal or constructive dismissal'
      sex 'Female'
      sexual_identity 'Bisexual'
      age_group 'Under 25'
      ethnicity 'Any other Mixed / multiple ethnic background'
      ethnicity_subgroup 'Mixed / multiple ethnic groups'
      disability 'Prefer not to say'
      caring_responsibility 'Prefer not to say'
      gender 'Female (including male-to-female trans women)'
      gender_at_birth 'Yes'
      pregnancy 'Prefer not to say'
      relationship 'Formerly in a same-sex civil partnership which is now legally dissolved'
      religion 'Christian (including Church of England, Catholic, Protestant and all other Christian denominations)'
    end

    trait :blank do
      claim_type nil
      sex nil
      sexual_identity nil
      age_group nil
      ethnicity nil
      ethnicity_subgroup nil
      disability nil
      caring_responsibility nil
      gender nil
      gender_at_birth nil
      pregnancy nil
      relationship nil
      religion nil
    end
  end
end