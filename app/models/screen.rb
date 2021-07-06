class Screen < ApplicationRecord
  belongs_to :theater

  validates :name, :theater, :no_of_seats,  presence: true
  validates :name, uniqueness: { scope: [:name, :theater] }
  has_many :shows
end
