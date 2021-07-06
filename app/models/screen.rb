class Screen < ApplicationRecord
  belongs_to :theater

  validates :name, :theater,  presence: { message: "must be given please" }
  validates :name, uniqueness: { scope: [:name, :theater] }
  has_many :shows
end
