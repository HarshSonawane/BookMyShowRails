class Payment < ApplicationRecord
  belongs_to :booking

  validates :booking, :medium, :status, presence: true
end
