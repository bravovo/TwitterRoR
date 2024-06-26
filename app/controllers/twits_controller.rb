class TwitsController < ApplicationController
  before_action :set_twit, only: %i[ show edit update destroy ]

  # GET /twits or /twits.json
  def index
    redirect_to root_path
  end

  # GET /twits/1 or /twits/1.json
  def show
  end

  # GET /twits/new
  def new
    @twit = Twit.new
  end

  # GET /twits/1/edit
  def edit
  end

  # POST /twits or /twits.json
  def create
    @twit = current_user.twits.new(twit_params)

    respond_to do |format|
      if @twit.save
        format.html { redirect_to twit_url(@twit), notice: "Твіт було успішно створено" }
        format.json { render :show, status: :created, location: @twit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twits/1 or /twits/1.json
  def update
    respond_to do |format|
      if @twit.update(twit_params)
        format.html { redirect_to twit_url(@twit), notice: "Твіт було успішно відредаговано" }
        format.json { render :show, status: :ok, location: @twit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twits/1 or /twits/1.json
  def destroy
    return if current_user != @twit.user
    @twit.destroy!

    respond_to do |format|
      format.html { redirect_to twits_url, notice: "Твіт було успішно видалено" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twit
      @twit = Twit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twit_params
      params.require(:twit).permit(:caption, :longitude, :latitude, :user_id, :allow_comments, :show_likes_count, :images)
    end
end
