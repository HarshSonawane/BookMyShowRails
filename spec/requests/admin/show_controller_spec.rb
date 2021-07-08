require 'rails_helper'

RSpec.describe "Admin::ShowControllers", type: :request do
  describe "GET index" do
    it "assigns all shows to @shows" do
      user = create(:user, role: 'admin')
      sign_in user
      theater = create(:theater)
      movie = create(:movie)
      screens = all(:screens)
      show = create(:show, screen: create(:screen), movie: movie)
      get "/admin/shows"
      expect(:shows) == ([@shows])
      expect(:movies) == ([@movies])
      expect(:screens) == ([@screens])
    end
  end

  describe "POST create" do
    it "creates show" do
      sign_in create(:user, role: 'admin')
      theater = create(:theater)
      show = create(:show)
      post "/admin/shows", params: { show: { time: Time.now, date: Date.today, screen: create(:screen), amount: 300} }
      expect(:show) == ([show])
      puts response
    end
  end

  describe "DELETE destroy" do
    it "deletes show" do
      sign_in create(:user, role: 'admin')
      show = create(:show)
      delete "/admin/shows/#{show.id}"
      puts response
    end
  end

  describe "POST update" do
    it "updates show" do
      sign_in create(:user, role: 'admin')
      show = create(:show)
      patch "/admin/shows/#{show.id}", params: { show: { time: Time.now }}
      expect(:show) == ([show])
    end
  end


end
