class MailChimp
  
  require "mailchimp"

  attr_accessor :mailchimp
  
  def initialize
    @mailchimp = Mailchimp::API.new(ENV['mailchimp-api-key'])
  end

  def subscribe(user)
    mailchimp.lists.subscribe(ENV['mailchimp-list_id'],{
      "email" => user.email
      }
    )
  end

end