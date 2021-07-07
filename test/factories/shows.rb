FactoryBot.define do
  factory :show do
    time { Faker::Internet.time }
    date { Faker::Internet.date }
    movie {Movie.first || association(:movie)}
    screen {Screen.first || association(:screen)}
  end
end