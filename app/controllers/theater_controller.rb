class TheaterController < ApplicationController
  def index
    @theaters = Theater.all
    @movies = Movie.featured
  end

  def movie
    @movie = Movie.find params[:id]
    @shows = @movie.shows
  end

  def movie_show
    @show = Show.find params[:id]
  end

  def show
    @theater = Theater.find params[:id]
    @screens = @theater.shows
  end

  def show_details
    @show = Show.find params[:id]
    @booked_seats = []
  end

  def shows
    @theater = Theater.find params[:theater_id]
    @shows = Show.joins(:screen).where(screen: { theater: @theater })
    # @shows = @theater.shows
  end

  def create_booking
    @booking = Booking.new(booking_params)
    if @booking.save
      @payment = Payment.new(booking: @booking, medium: 'direct', status: 'completed')
      @payment.save()
      redirect_to root_path, notice: "Your booking was successfull for seat #{@booking.seats}"
    end
  end

  def booking_params
    params.require(:booking).permit(:user_id, :show_id, :seats, :amount, :is_confirmed)
  end
  
end
