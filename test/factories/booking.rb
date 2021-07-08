FactoryBot.define do
  factory :booking do
  seats { "23,24,25" }
  show { Show.first || association(:show)}
  user { User.first || association(:user)}
  end
end