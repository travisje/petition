class SignersController < ApplicationController
  def new
    @signer = Signer.new
  end

  def create
    @signer = Signer.new(signer_params)
    if @signer.save
      redirect_to signer_path(@signer)
    elsif Signer.find_by(email: params[:signer][:email])
      flash.now[:alert] = "The petition has already been signed by a user with this email. Please enter a valid email address."
      render 'new'
    else
      binding.pry
      flash.now[:alert] = "Please enter a valid email address."
      render 'new'
    end
  end

  def show
    @signer = Signer.find(params[:id])
  end
  
  def index

  end

  private
    def signer_params 
      params.require(:signer).permit(:first_name, :last_name, :email, :country, :street_address, :zip, :comment, :display_sig, :showcase)
    end

end
