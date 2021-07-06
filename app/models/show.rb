class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :screen

  validates :movie, :screen, :time, :date,  presence: true

  has_many :bookings
end
