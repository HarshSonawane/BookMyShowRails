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

  def update_screen
    @screen = Screen.find params[:id]
    @screen.update(screen_params)
    redirect_to theater_admin_screens_path(current_user)
  end

  def screens
    @theater = UserTheater.where(user: current_user).first
    @screens = @theater.theater.screens
    @screen = Screen.new
  end

  def create_screen
    @screen = Screen.create(screen_params)
    @theater = UserTheater.where(user: current_user).first
    @screens = @theater.theater.screens
    if @screen.save
      respond_to do |format|
        format.js
      end
    end
  end

  def edit_screen
    @theater = UserTheater.where(user: current_user).first
    @screens = @theater.theater.screens
    @screen = Screen.find params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def delete_screen
    @screen = Screen.find params[:id]
    @screen.delete
    @theater = UserTheater.where(user: current_user).first
    @screens = @theater.theater.screens
    respond_to do |format|
          format.js
    end
  end


  def create_show
    @show = Show.create(show_params)
    @theater = UserTheater.where(user: current_user).first
    @shows = Show.joins(:screen).where(screen: { theater: @theater })
    @screens = @theater.theater.screens
    respond_to do |format|
      if @show.save
        format.js
      else
        format.js
        @message.errors.any?
        @message.errors.each do |key, value|
        end
      end
    end
  end

  def delete_show
    @show = Show.find params[:id]
    @show.delete
    @theater = UserTheater.where(user: current_user).first
    @shows = Show.joins(:screen).where(screen: { theater: @theater })
    @show = Show.new
    @movies = Movie.all
    @screens = Screen.where(theater: @theater)
    respond_to do |format|
      format.js
    end
  end

  def bookings
  end

  def payments
  end

  def show_params
    params.require(:show).permit(:time, :date, :movie_id, :screen_id)
  end

  def screen_params
      params.require(:screen).permit(:name, :no_of_seats, :theater_id)
  end
end
