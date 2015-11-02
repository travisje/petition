class MailChimp
  
  require "mailchimp"

  attr_accessor :mailchimp
  
  def initialize
    @mailchimp = Mailchimp::API.new(ENV['mailchimp_api_key'])
  end

  def subscribe(signer)
    mailchimp.lists.subscribe(ENV['mailchimp_list_id'], {:email => signer.email}, {"FNAME" => signer.first_name, "LNAME" => signer.last_name}, "HTML", false, false, false, true)
  end

  

end