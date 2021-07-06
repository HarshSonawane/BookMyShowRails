require 'rails_helper'

RSpec.describe Payment, type: :model do
  context "validation  tests" do 
    it "validates presence" do
      object = Payment.new
      object.validate
      expect(object.errors[:booking]).to include("can't be blank")
      expect(object.errors[:medium]).to include("can't be blank")
    end
  end
end
