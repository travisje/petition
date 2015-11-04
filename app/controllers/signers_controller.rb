class SignersController < ApplicationController
  
  def new
    @signer = Signer.new
  end

  def create
    @signer = Signer.new(signer_params)
    if @signer.save
      render 'success'
      mailchimp = MailChimp.new
      mailchimp.subscribe(@signer)
      GoogleSheet.new(@signer).add_record
    else 
      flash.now[:alert] = @signer.pretty_errors
      render 'new'
    end
  end

  private

    def signer_params 
      params.require(:signer).permit(:first_name, :last_name, :email, :country, :company, :occupation, :comment, :display_sig, :showcase)
    end

end