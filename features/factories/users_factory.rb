require 'faker'

FactoryBot.define do
  factory :users, class: OpenStruct do
    name 'Dummy Data'
    email 'Dummy'
    username 'Dummy'
    department 'London'
    password 'password'
    users_file 'et_admin_users.csv'
  end
end