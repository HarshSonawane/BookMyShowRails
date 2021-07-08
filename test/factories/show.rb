FactoryBot.define do
  factory :show do
    time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)  }
    date { Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
    movie { Movie.first || association(:movie)}
    screen { Screen.first || association(:screen)}
    amount { 300 }
  end
end