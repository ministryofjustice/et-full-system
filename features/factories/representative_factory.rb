FactoryBot.define do
  factory :representative, class: OpenStruct do
    type 'Solicitor'
    organisation_name { Faker::Company.bs }
    name 'Solicitor Name'
    building '106'
    street 'Mayfair'
    locality 'London'
    county 'Greater London'
    post_code  'SW1H 9PP'
    telephone_number '01111 123456'
    alternative_telephone_number '02222 654321'
    email_address  'solicitor.test@digital.justice.gov.uk'
    dx_number  'dx1234567890'
  end
end
