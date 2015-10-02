class SignerMailer < ApplicationMailer
  default from: 'notifications@ArtApp.org'
   
  def welcome_email(signer)
    @signer = signer
    @url  = 'http://www.ArtApp.org'
    mail(to: @signer.email, subject: 'Thank you for making your voice heard')
    # http://stackoverflow.com/questions/17141004/errnoeconnrefused-connection-refused-connect2-for-action-mailer
  end

end
