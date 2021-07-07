require 'rails_helper'

RSpec.describe "Theaters", type: :request do

  describe "GET index" do
    it "assigns all theater to @theaters" do
      @theaters = all(:theaters)
      @movies = Movie.featured
      get theater_index_path
      expect(:theaters) == ([Theater.all])
      expect(:movies) == ([@movies])
    end

    it "redirect when not logged in" do
      get '/'
      expect(response).to redirect_to('/users/sign_in')  
    end

  end

  describe 'the signin process', type: :feature do
    before :each do
      User.create(email: 'user1@gmail.com', password: 'password', name: 'harsh', city: 'satana', phone: '4387523842')
    end
    it 'signs @user in' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'user1@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
     expect(current_path).to eq(root_path)
     expect(page).to have_text('Signed in successfully.')
    end
   end

  describe "GET movie", type: :feature do
    before :each do
      @movie = Movie.create(name: 'sample movue', release_date: '12-12-2021')
    end
    it "assigns all shows to @shows" do
      get movie_path(1)
      expect(:shows) == ([@movie])
      expect(:movie) == ([@movie])
    end

  end
  
end