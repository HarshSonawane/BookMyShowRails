FactoryBot.define do
  factory :screen do
    name { Faker::Internet.name }
    no_of_seats { Faker::Internet.no_of_seats }
    theater {Theater.first || association(:theater)}
  end
end