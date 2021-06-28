class UserTheater < ApplicationRecord
  belongs_to :user
  belongs_to :theater
end
