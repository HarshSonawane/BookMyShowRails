class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show edit update destroy ]

  def show
    @show = Show.find params[:id]
    @booked_seats = @show.bookings.where(is_confirmed: true).pluck(:seats).map{|s| s.split(",")}.flatten.uniq.map(&:to_i)
    @booking = Booking.new
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    respond_to do |format|
      if @show.save
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @show.update(show_params)
        format.js
        format.html { redirect_to @show, notice: "Show was successfully updated." }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @show.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to shows_url, notice: "Show was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_show
      @show = Show.find(params[:id])
    end

    def show_params
      params.require(:show).permit(:time, :date, :movie_id, :screen_id)
    end

    def booking_params
      params.require(:booking).permit(:user_id, :show_id, :seats, :amount)
    end

end
