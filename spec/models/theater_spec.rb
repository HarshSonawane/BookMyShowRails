require 'rails_helper'

RSpec.describe Theater, type: :model do
  context "validation  tests" do 
    it "validates presence" do
      object = Theater.new
      object.validate
      expect(object.errors[:name]).to include("can't be blank")
      expect(object.errors[:pincode]).to include("can't be blank")
    end
  end
end
