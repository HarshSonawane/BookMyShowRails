require 'rails_helper'

RSpec.describe UserTheater, type: :model do
  context "validation  tests" do 
    it "validates presence" do
      object = UserTheater.new
      object.validate
      expect(object.errors[:user]).to include("can't be blank")
      expect(object.errors[:theater]).to include("can't be blank")
    end
  end
end
