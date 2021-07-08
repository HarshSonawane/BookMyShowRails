FactoryBot.define do
  factory :theater do
    name { Faker::Ancient.name }
    pincode { Faker::Address.zip_code }
    city {City.first || association(:city)}
  end
end