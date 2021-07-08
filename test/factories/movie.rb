require 'securerandom'
FactoryBot.define do
  factory :movie do
    name { SecureRandom.hex }
    release_date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    description { "sample" }
    runtime { 10 }
  end
end