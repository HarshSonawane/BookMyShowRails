FactoryBot.define do
  factory :movie do
    name { Faker::Internet.name }
    release_date { Faker::Internet.release_date }
    description { Faker::Internet.name }
    runtime { Faker::Internet.runtime }
    is_featured{ Faker::Internet.is_featured }
  end
end