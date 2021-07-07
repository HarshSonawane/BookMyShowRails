FactoryBot.define do
  factory :theater do
    name { Faker::Ancient.name }
    pincode { Faker::Address.pincode }
    city {City.first || association(:city)}
  end
end