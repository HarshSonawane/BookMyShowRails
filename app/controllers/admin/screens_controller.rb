class Admin::ScreensController < Admin::BaseController
  before_action :set_screen, only: %i[ show edit update destroy ]
  
  # GET /screens or /screens.json
  def index
    @theater = UserTheater.where(user: current_user).first
    if @theater.nil?
      redirect_to root_path
    else
      @screens = @theater.theater.screens
      @screen = Screen.new
    end
  end

  # GET /screens/new
  def new
    @screen = Screen.new
  end

  # POST /screens or /screens.json
  def create
    @screen = Screen.new(screen_params)
    respond_to do |format|
      if @screen.save
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @screen = Screen.find params[:id]
  end

  # PATCH/PUT /screens/1 or /screens/1.json
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

  # DELETE /screens/1 or /screens/1.json
  def destroy
    @screen.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to screens_url, notice: "Screen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screen
      @screen = Screen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def screen_params
      params.require(:screen).permit(:name, :no_of_seats, :theater_id)
    end
end
