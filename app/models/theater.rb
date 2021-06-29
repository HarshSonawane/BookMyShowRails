class Theater < ApplicationRecord
  belongs_to :city
  has_many :screens

  has_many :users

  has_and_belongs_to_many :shows , join_table: "screens"

  has_one_attached :image
end
