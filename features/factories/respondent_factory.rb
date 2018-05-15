require 'faker'

FactoryBot.define do
  factory :respondent, class: OpenStruct do
    name { Faker::Company.name }
    building { Faker::Address.building_number }
    street { Faker::Address.street_name }
    locality 'London'
    county 'Greater London'
    post_code 'SW1H 9QR'
    telephone_number '02222 321654'
    acas_number 'AC123456/78/90'

    trait :work_address do
      building '110'
      street 'Piccadily Circus'
      locality 'London'
      county 'Greater London'
      post_code 'SW1H 9ST'
      telephone_number '03333 423554'
    end
    
  end
end
