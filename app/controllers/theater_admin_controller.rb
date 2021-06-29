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
  end

  def screens
    @theater = UserTheater.where(user: current_user).first
    @screens = @theater.theater.screens
  end

  def create_screen
  end

  def edit_screen
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_show
  end

  def bookings
  end

  def payments
  end

  def show_params
  end

  def screen_params
  end
end
