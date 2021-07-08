FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "81181981" }
    name { Faker::Name.name }
    city { "Satana" }
    phone { "8888888888" }
    role { 'user' }
  end
end