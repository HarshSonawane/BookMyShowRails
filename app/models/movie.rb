class Movie < ApplicationRecord
  has_many :shows

  has_one_attached :cover

  scope :featured, -> { where(is_featured: true) }
end
