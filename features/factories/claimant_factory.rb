require 'faker'

FactoryBot.define do
  factory :claimant, class: OpenStruct do
    first_name 'first'
    
    trait :answer_data do
      has_special_needs 'Yes'
      special_needs 'My special needs are as follows'
      telephone_number '01234 567890'
      alternative_telephone_number '01234 098765'
      email_address 'test@digital.justice.gov.uk'
      correspondence 'Email'
      memorable_word 'password'
    end

    trait :person_data do
      title 'Mr'
      first_name { Faker::Name.first_name }
      last_name 'Last'
      date_of_birth '21/11/1982'
      gender 'Male'
      building { Faker::Address.building_number }
      street { Faker::Address.street_name }
      locality 'London'
      county 'Greater London'
      post_code 'SW1H 9AJ'
    end

    factory :first_person, traits: [:answer_data, :person_data]
    factory :group_claims, traits: [:person_data]
  end
end