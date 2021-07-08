class UserTheater < ApplicationRecord
  belongs_to :user
  belongs_to :theater

  validates :user, :theater,  presence: true
  validates :user, uniqueness: true
end
