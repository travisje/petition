class Signer < ActiveRecord::Base
  validates :first_name, :last_name, :country, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true, uniqueness: {case_sensitive: false}
  
  def email=(email)
    write_attribute(:email, email.downcase)
  end

end
