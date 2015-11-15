class SignsController < ApplicationController
  before_action :set_sign, only: [:show, :edit, :update, :destroy]


  def index
    @signs= Sign.all
  end


  def show
  end


  def new
    @sign = Sign.new
  end

  def edit
  end


  def create
    @song = Sign.new(sign_params)

    respond_to do |format|
      if @sign.save
        format.html { redirect_to @sign, notice: 'Sign was successfully created.' }
        format.json { render :show, status: :created, location: @sign }
      else
        format.html { render :new }
        format.json { render json: @sign.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @sign.update(sign_params)
        format.html { redirect_to @sign, notice: 'Sign was successfully updated.' }
        format.json { render :show, status: :ok, location: @sign }
      else
        format.html { render :edit }
        format.json { render json: @sign.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @sign.destroy
    respond_to do |format|
      format.html { redirect_to signs_url, notice: 'Sign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign
      @sign = Sign.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_params
      params.require(:sign).permit(:name, :image_1, :image_2, :birth_range, :cover, :horoscope, :slug)
    end
end