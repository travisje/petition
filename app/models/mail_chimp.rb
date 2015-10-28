class MailChimp
  
  require "mailchimp"

  attr_accessor :mailchimp
  
  def initialize
    @mailchimp = Mailchimp::API.new(ENV['mailchimp-api-key'])
  end

  def subscribe(signer)
    mailchimp.lists.subscribe(ENV['mailchimp-list_id'], {:email => signer.email}, {"FNAME" => signer.first_name, "LNAME" => signer.last_name}, "HTML", false, false, false, true)
  end

  # def subscribe(signer)
    
  #   mailchimp.lists.batch_subscribe(ENV['mailchimp-list_id'], subscriber(signer), false, false, false)
  # end

  def subscriber(signer)
    [
      { "EMAIL" => { "email" => signer.email},
        :EMAIL_TYPE => 'html',
        :merge_vars => { 
          "FNAME" => signer.first_name,
          "LNAME" => signer.last_name
        }
      }
    ]
  end

end