factory :booking do
  seats { Faker::Internet.seats }
  show { Show.first || association(:show)}
  user { User.first || association(:user)}
  is_confirmed { Faker::Internet.is_confirmed }
end
end