require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is valid with valid attributes" do
    expect(Movie.new).to be_valid
  end
end
