class SignersController < ApplicationController
  
  def new
    @signer = Signer.new
  end

  def create
    @signer = Signer.new(signer_params)
    if @signer.save
      render 'success'
      @signer.process_subscription
      @signer.add_to_spreadsheet
    else 
      flash.now[:alert] = @signer.pretty_errors
      render 'new'
    end
  end

  private

    def signer_params 
      params.require(:signer).permit(:first_name, :last_name, :email, :country, :occupation, :comment, :display_sig, :subscribe)
    end

end