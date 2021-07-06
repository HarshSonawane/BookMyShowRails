class Movie < ApplicationRecord
  has_many :shows

  validates :name, :release_date,  presence: { message: "must be given please" }
  validates :name, uniqueness: true

  has_one_attached :cover

  scope :featured, -> { where(is_featured: true) }
end
