FactoryBot.define do
  factory :diversity, class: OpenStruct do
    claim_type 'Unfair dismissal or constructive dismissal'
    sex 'Female'
    gender 'Female (including male-to-female trans women)'
    gender_at_birth 'Yes'
    sexual_identity 'Bisexual'
    relationship_status 'Formerly in a same-sex civil partnership which is now legally dissolved'
    age_group 'Under 25'
    responsibilites 'Prefer not to say'
    religion 'Christian (including Church of England, Catholic, Protestant and all other Christian denominations)'
    ethnic_group 'Mixed / multiple ethnic groups'
    ethnic_type 'Any other Mixed / multiple ethnic background'
    health 'Prefer not to say'
    pregnancy 'Prefer not to say'
  end
end
