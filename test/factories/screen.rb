require 'securerandom'

FactoryBot.define do
  factory :screen do
    name { SecureRandom.hex }
    no_of_seats { 120 }
    theater { Theater.first || association(:theater) }
  end
end