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
    @sign = Sign.new(sign_params)
    if @shirt.save
        #flash[:notice] = "New shirt created"
        redirect_to shirt_path(@shirt), notice: "New sign created."
    else
      render :new
    end
  end


  def update
      @sign.update(sign_params)
  end


  def destroy
    @sign.destroy
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