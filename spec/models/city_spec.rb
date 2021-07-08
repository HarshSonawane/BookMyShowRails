require 'rails_helper'

RSpec.describe City, type: :model do
  context "validation  tests" do 
    it "validates presence" do
      movie = City.new
      movie.validate
      expect(movie.errors[:name]).to include("can't be blank")
      expect(movie.errors[:state]).to include("can't be blank")
    end
  end
end
