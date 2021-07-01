class TheaterAdminController < ApplicationController
  # layout false
  def index
    @theater = UserTheater.where(user: current_user).first
    @screens = @theater.theater.screens
  end

  def show
    @theater = UserTheater.where(user: current_user).first
    @screens = @theater.theater.screens
  end

  def shows
    @theater = UserTheater.where(user: current_user).first
    @shows = Show.joins(:screen).where(screen: { theater: @theater })
    @show = Show.new
    @movies = Movie.all
    @screens = Screen.where(theater: @theater)
  end

  def screens
    @theater = UserTheater.where(user: current_user).first
    @screens = @theater.theater.screens
    @screen = Screen.new
  end

  def bookings
  end

  def payments
  end

  
end
