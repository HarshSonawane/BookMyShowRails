class City < ApplicationRecord
  has_many :theaters

  validates :name, :state, presence: true
end
