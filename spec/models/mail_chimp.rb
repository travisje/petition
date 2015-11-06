require 'rails_helper'
require 'vcr'


describe MailChimp do
  it "adds a signer to mailing list" do
    signer = create(:signer, email: 'dadom@mrtrx.com')
    mailchimp = MailChimp.new
    VCR.use_cassette 'models/mailchimp_response' do
      mailchimp_response = mailchimp.subscribe(signer)
      expect(mailchimp_response["email"]).to eq(signer.email)
    end
  end
end