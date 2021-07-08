require 'rails_helper'

RSpec.describe Show, type: :model do
  context "validation  tests" do 
    it "validates presence" do
      object = Show.new
      object.validate
      expect(object.errors[:movie]).to include("can't be blank")
      expect(object.errors[:screen]).to include("can't be blank")
      expect(object.errors[:time]).to include("can't be blank")
      expect(object.errors[:date]).to include("can't be blank")
      expect(object.errors[:amount]).to include("can't be blank")
    end
  end
end
