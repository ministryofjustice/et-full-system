FactoryBot.define do
  factory :address, class: OpenStruct do
    building '102'
    street 'Petty France'
    locality 'London'
    county 'Greater London'
    post_code 'SW1H 9AJ'
  end
end
