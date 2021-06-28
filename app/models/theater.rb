class Theater < ApplicationRecord
  belongs_to :city
  has_many :screens

  has_many :users

  has_one_attached :image
end
