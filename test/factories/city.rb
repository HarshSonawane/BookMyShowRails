FactoryBot.define do
  factory :city do
    name { Faker::Address.name }
    state { Faker::Address.state }
  end
end