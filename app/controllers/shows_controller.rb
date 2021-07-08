class ShowsController < ApplicationController
  before_action :set_show, only: %i[ show edit update destroy ]

  def show
    @show = Show.find params[:id]
    @booked_seats = @show.bookings.where(is_confirmed: true).pluck(:seats).map{|s| s.split(",")}.flatten.uniq.map(&:to_i)
    @booking = Booking.new
  end

  private
    def set_show
      @show = Show.find(params[:id])
    end

end
