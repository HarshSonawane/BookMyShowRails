require 'rails_helper'

RSpec.describe Screen, type: :model do
  context "validation  tests" do 
    it "validates presence" do
      object = Screen.new
      object.validate
      expect(object.errors[:name]).to include("can't be blank")
      expect(object.errors[:theater]).to include("can't be blank")
    end
  end
end
