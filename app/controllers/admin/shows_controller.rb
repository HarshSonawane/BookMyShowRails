class Admin::ShowsController < ApplicationController
  before_action :set_show, only: %i[ show edit update destroy ]
  before_action :set_theater

  def index
    @shows =  @theater.shows
    @show = Show.new
    @movies = Movie.all
    @screens = @theater.screens
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
        format.js {  flash[:notice] = @show.errors }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

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
    @movies = Movie.all
    @screens = @theater.screens
  end

  private
    def set_show
      @show = Show.find(params[:id])
    end

    def set_theater
      @ut = UserTheater.where(user: current_user).first
      if @ut.nil?
        redirect_to root_path
      else
        @theater = @ut.theater
      end
    end

    def show_params
      params.require(:show).permit(:time, :date, :movie_id, :screen_id)
    end
end
