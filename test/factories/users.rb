FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Internet.name }
    city { Faker::Internet.city }
    phone { Faker::Internet.phone }
  end
end