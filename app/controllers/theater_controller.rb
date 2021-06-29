class TheaterController < ApplicationController
  def index
    @theaters = Theater.all
    @movies = Movie.featured
  end

  def new
  end

  def create
  end

  def movie
    @movie = Movie.find params[:id]
    @shows = Show.where(movie: @movie)
  end

  def movie_show
    @show = Show.find params[:id]
  end

  def show
    @theater = Theater.find params[:id]
    @screens = Screen.where(theater: @theater)
    @shows = Show
  end

  def shows
    @theater = Theater.find params[:theater_id]
    @shows = Show.joins(:screen).where(screen: { theater: @theater })
  end

  def screens
  end
end
