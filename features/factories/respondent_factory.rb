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
        post_code: 'WD18 7SQ',
        telephone_number: '03333 423554'
    end

    trait :yes_acas do
      name { Faker::Company.name }
      building { Faker::Address.building_number }
      street { Faker::Address.street_name }
      locality 'London'
      county 'Greater London'
      post_code 'SW1H 9QR'
      acas_number 'AC123456/78/90'
      telephone_number '02222 321654'
    end

    trait :no_acas do
      name { Faker::Company.name }
      building { Faker::Address.building_number }
      street { Faker::Address.street_name }
      locality 'London'
      county 'Greater London'
      post_code 'SW1H 9QR'
      no_acas_number_reason :"simple_form.options.respondent.no_acas_number_reason.joint_claimant_has_acas_number"
      telephone_number '02222 321654'
    end

    factory :conciliation_acas_number, traits: [:work_address, :yes_acas]
    factory :acas_number_reason, traits: [:work_address, :no_acas]
    factory :et3_data, traits: [:yes_acas, :et3]
  end
end