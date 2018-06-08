require 'faker'

FactoryBot.define do
  factory :respondent, class: OpenStruct do
    trait :work_address do
      association :work_address,
        factory: :address,
        building: '101',
        street: 'Petty France',
        locality: 'London',
        county: 'Greater London',
        post_code: 'BS1 1DZ',
        telephone_number: '03333 423554'
    end

    trait :employer do
      name { Faker::Company.name }
      building { Faker::Address.building_number }
      street { Faker::Address.street_name }
      locality 'London'
      county 'Greater London'
      post_code 'SW1H 9QR'
      acas_number 'AC123456/78/90'
      telephone_number '02222 321654'
    end

    factory :organisation_data, traits: [:work_address, :employer]
    factory :et3_data, traits: [:employer, :et3]
  end
end