require 'faker'

FactoryBot.define do
  factory :admin_user, class: OpenStruct do
    email 'admin@example.com'
    password 'password'

    trait :acas_only do
      email 'junioruser@example.com'
    end
  end
end
