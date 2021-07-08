FactoryBot.define do
  factory :user_theater do
    user { User.first || association(:movie)}
    theater { Theater.first || association(:screen)}
  end
end