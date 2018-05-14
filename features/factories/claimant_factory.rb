FactoryBot.define do
  factory :claimant, class: OpenStruct do
    title 'Mr'
    first_name 'First'
    last_name 'Last'
    date_of_birth '21/11/1982'
    gender 'Male'
    has_special_needs 'Yes'
    special_needs 'My special needs are as follows'
    building '102'
    street 'Petty France'
    locality 'London'
    county 'Greater London'
    post_code 'SW1H 9AJ'
    country 'United Kingdom'
    telephone_number '01234 567890'
    alternative_telephone_number '01234 098765'
    email_address 'test@digital.justice.gov.uk'
    correspondence 'Email'
    memorable_word 'password'
  end
end
