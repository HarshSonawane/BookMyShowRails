class Admin::ScreensController < Admin::BaseController
  before_action :set_screen, only: %i[ show edit update destroy ]
  before_action :set_theater
  
  def index
    @screens = @theater.screens
    @screen = Screen.new
  end

  # def new
  #   @screen = Screen.new
  # end

  def create
    @screen = Screen.new(screen_params)
    respond_to do |format|
      if @screen.save
        format.js
      else
        @errors = @screen.errors
        flash.now[:messages] = @screen.errors.full_messages[0]
        format.js
      end
    end
  end

  def edit
    @screen = Screen.find params[:id]
  end

  def update
    respond_to do |format|
      if @screen.update(screen_params)
        format.js
        format.html { redirect_to admin_screens_path, notice: "Screen was successfully updated." }
        format.json { render :show, status: :ok, location: @screen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @screen.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to screens_url, notice: "Screen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_screen
      @screen = Screen.find(params[:id])
    end

    def set_theater
      @ut = UserTheater.where(user: current_user).first
      if @ut.nil?
        redirect_to root_path
      else
        @theater = @ut.theater
      end
    end

    def screen_params
      params.require(:screen).permit(:name, :no_of_seats, :theater_id)
    end
end
