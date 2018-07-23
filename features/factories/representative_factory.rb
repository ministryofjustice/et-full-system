FactoryBot.define do
  factory :representative, class: OpenStruct do
  end

  trait :et3_information do
    type 'Solicitor'
    organisation_name { Faker::Company.bs }
    name { Faker::Name.name }
    building '106'
    street 'Mayfair'
    locality 'London'
    county 'Greater London'
    post_code 'SW1H 9PP'
    telephone_number '01111 123456'
    alternative_telephone_number '02222 654321'
    email_address  'sivvoy.taing@hmcts.net'
    dx_number  'dx1234567890'
    have_representative 'Yes'
    representative_mobile '07987654321'
    representative_reference 'Rep Ref'
    representative_contact_preference 'Fax'
    representative_fax '0207 345 6789'
    representative_disability 'Yes'
    representative_disability_information 'Lorem ipsum disability'
  end

  trait :et3_no_representative do
    type ''
    organisation_name ''
    name ''
    building ''
    street ''
    locality ''
    county ''
    post_code ''
    telephone_number ''
    alternative_telephone_number ''
    email_address  ''
    dx_number  ''
    have_representative 'No'
    representative_mobile ''
    representative_reference ''
    representative_contact_preference 'nil'
    representative_fax ''
    employer_contract_claim ''
    representative_disability 'nil'
    representative_disability_information ''
  end
end
