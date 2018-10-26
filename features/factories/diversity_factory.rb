FactoryBot.define do
  factory :diversity, class: OpenStruct do
    trait :not_blank do
      claim_type :"claim_type.discrimination"
      sex :"sex.female"
      sexual_identity :"bisexual.sexual_identity"
      age_group :"age_group.under-25"
      ethnicity :"ethnicity.mixed-multiple-ethnic-groups"
      ethnicity_subgroup :"ethnicity_subgroup.irish"
      disability :"disability.prefer-not-to-say"
      caring_responsibility :"caring_responsibility.yes_answer"
      gender :"gender.male-including-female-to-male-trans-men"
      gender_at_birth :"gender_at_birth.bananas"
      pregnancy :"pregnancy.yes_answer"
      relationship :"relationship.married"
      religion :"religion.no-religion"
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