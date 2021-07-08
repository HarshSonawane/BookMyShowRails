require 'rails_helper'
require_relative '../support/controller_macros'



RSpec.describe "Theaters", type: :request do
  include Devise::Test::IntegrationHelpers
  describe "GET index" do
    it "assigns all theater to @theaters" do
      sign_in create(:user)
      get "/"
      expect(:theaters) == ([all(:theaters)])
      expect(:movies) == ([all(:movies)])
    end
  end
  
  describe "GET movie", type: :feature do
    it "assigns all shows to @shows" do
      sign_in create(:user)
      m = create(:movie)
      get "/movie/#{m.id}/"
      expect(:shows) == ([create(:show)])
      expect(:movie) == ([m])
    end
  end

  describe "GET show", type: :feature do
    it "assigns theater to @theater" do
      sign_in create(:user)
      theater = create(:theater)
      get "/theater/#{theater.id}/"
      expect(:theater) == ([theater])
    end
  end

  describe "GET show_details", type: :feature do
    it "assigns show to @show" do
      sign_in create(:user)
      show = create(:show)
      theater = create(:theater)
      booked_seats = []
      get "/theater/#{theater.id}/shows/#{show.id}"
      expect(:show) == ([show])
      expect(:booked_seats) == ([booked_seats])
    end
  end

  describe "GET shows", type: :feature do
    it "assigns shows to @shows" do
      sign_in create(:user)
      theater = create(:theater)
      shows = theater.shows
      get "/theater/#{theater.id}/shows"
      expect(:theater) == ([theater])
      expect(:shows) == ([shows])
    end
  end

  describe "POST create_booking", type: :feature do
    it "assigns booking to @booking" do
      user = create(:user)
      puts user.inspect
      sign_in user
      show = create(:show)
      puts show.inspect
      booking = create(:booking)
      puts booking.inspect
      post "/booking", params: { booking: { show_id: show.id, user_id: user.id, seats: "23,,45", amount: 600, is_confirmed: true}}
      expect(:booking) == ([booking])
      puts response
    end
  end
  
end