FactoryBot.define do
  factory :respondent, class: OpenStruct do
    name "Respondent Name"
    building '108'
    street 'Regent Street'
    locality 'London'
    county 'Greater London'
    post_code 'SW1H 9QR'
    telephone_number '02222 321654'
    address
    association :work_address, factory: :address

    trait :work_address do
      association :work_address,
        factory: :address,
        building: '110',
        street: 'Piccadily Circus',
        locality: 'London',
        county: 'Greater London',
        post_code: 'SW1H 9ST',
        telephone_number: '03333 423554'
    end
    acas_number 'AC123456/78/90'
  end
end
