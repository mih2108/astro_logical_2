class SignsController < ApplicationController
  before_action :set_sign, only: [:show, :edit, :update, :destroy]


  def index
    @signs= Sign.all
  end

  def about
  end

  def contact
  end

  def show
        @sign=Sign.find(params[:id])
    #   begin
    #   # @sign=Sign.find_by_slug(params[:id])
    
    #   # respond_to do |format|
    #   #   format.html # show.html.erb
    #   #   format.json {render json @sign}
    #   # end

    # rescue
    #   redirect_to root_path, notice: "Unavailable"
    # end
  end


  def new
    @sign = Sign.new
  end

  def edit
  end


  def create
    @sign = Sign.new(sign_params)
    if @sign.save
        #flash[:notice] = "New shirt created"
        redirect_to sign_path(@sign), notice: "New sign created."
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
      params.require(:sign).permit(:name, :image_1, :birth_range, :horoscope, :slug)
    end
end