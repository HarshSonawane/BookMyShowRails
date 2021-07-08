require 'rails_helper'

RSpec.describe Booking, type: :model do
  context "validation  tests" do 
    it "validates presence" do
      booking = Booking.new
      booking.validate
      expect(booking.errors[:show]).to include("can't be blank")
      expect(booking.errors[:user]).to include("can't be blank")
      expect(booking.errors[:seats]).to include("can't be blank")
    end
  end
end
