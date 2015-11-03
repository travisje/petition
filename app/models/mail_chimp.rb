class MailChimp
  
  require "mailchimp"

  attr_reader :mailchimp
  
  def initialize
    begin
      @mailchimp = Mailchimp::API.new(ENV['mailchimp_api_key'])
    rescue => e
      Rails.logger.error {"Mailchimp List Signup Error - #{e.message}"}
      @mailchimp = nil
    end
  end

  def subscribe(signer)
    if mailchimp
      begin
        mailchimp.lists.subscribe(ENV['mailchimp_list_id'], {:email => signer.email}, {"FNAME" => signer.first_name, "LNAME" => signer.last_name}, "HTML", false, false, false, true)
      rescue => e
        Rails.logger.error {"Mailchimp List Signup Error - #{e.message}"}
      end
    end
  end

end