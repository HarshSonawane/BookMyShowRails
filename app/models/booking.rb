class Booking < ApplicationRecord
  belongs_to :show
  belongs_to :user

  validates :show, :user, :seats,  presence: true
  

  after_save do
    Payment.create(booking: self, medium: 'direct', status: 'completed')
  end
end
