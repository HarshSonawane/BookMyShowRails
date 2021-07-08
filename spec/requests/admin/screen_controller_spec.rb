require 'rails_helper'

RSpec.describe "Admin::ScreenControllers", type: :request do
  include Devise::Test::IntegrationHelpers
  describe "GET index" do
    it "assigns all screens to @screens and shows to @shows and theater to @theater" do
      user = create(:user, role: 'admin')
      theater = create(:theater)
      user_theater = create(:user_theater, user: user, theater: theater)
      sign_in user
      screen = create(:screen, theater: theater)
      screens = theater.screens
      get "/admin"
      expect(:screens) == ([@screens])
      expect(:screen) == ([@screen])
      expect(:theater) == ([@theater])
    end

    it "redirects to home" do
      user = create(:user, role: 'user')
      puts user.inspect
      sign_in user
      expect(response).to redirect_to(get '/')
    end
  end

  describe "POST create" do
    it "creates screen" do
      sign_in create(:user, role: 'admin')
      theater = create(:theater)
      screen = create(:screen)
      post "/admin/screens", params: { screen: { name: screen.name, no_of_seats: screen.no_of_seats, theater: theater.id}}
      expect(:screen) == ([screen])
    end
  end

  describe "GET edit" do
    it "assigns a screen to @screen" do
      sign_in create(:user, role: 'admin')
      screen = create(:screen)
      get "/admin/screens/#{screen.id}"
      expect(:screen) == ([screen])
    end
  end

  describe "DELETE destroy" do
    it "deletes screen" do
      sign_in create(:user, role: 'admin')
      screen = create(:screen)
      delete "/admin/screens/#{screen.id}"
    end
  end


  describe "POST update" do
    it "updates screen" do
      sign_in create(:user, role: 'admin')
      theater = create(:theater)
      screen = create(:screen)
      patch "/admin/screens/#{screen.id}", params: { screen: { name: "New name for the screen", no_of_seats: screen.no_of_seats, theater: theater.id}}
      expect(:screen) == ([screen])
    end
  end


end
