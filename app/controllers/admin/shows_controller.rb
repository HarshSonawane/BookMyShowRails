class Admin::ShowsController < ApplicationController
  before_action :set_show, only: %i[ show edit update destroy ]

  # GET /shows or /shows.json
  def index
    @theater = UserTheater.where(user: current_user).first
    if @theater.nil?
      redirect_to root_path
    else
      @shows = Show.joins(:screen).where(screen: { theater: @theater })
      @show = Show.new
      @movies = Movie.all
      @screens = Screen.where(theater: @theater)
    end
  end

  # GET /shows/1 or /shows/1.json
  def show
    
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows or /shows.json
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

  # PATCH/PUT /shows/1 or /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.js
        format.html { redirect_to admin_shows_path, notice: "Show was successfully updated." }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1 or /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to shows_url, notice: "Show was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
    @show = Show.find params[:id]

    @theater = UserTheater.where(user: current_user).first
    @movies = Movie.all
    @screens = Screen.where(theater: @theater)
  end


  def bookings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.require(:show).permit(:time, :date, :movie_id, :screen_id)
    end
end
