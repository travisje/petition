class Signer < ActiveRecord::Base
  
  

  validates :first_name, :last_name, presence: true
  validates :country, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true
  validates :email, uniqueness: {case_sensitive: false, message: "address has already been used for sign up. Please enter a valid Email address."}


  def email=(email)
    if email
      write_attribute(:email, email.downcase)
    else
      write_attribute(:email, nil)
    end
  end

  def pretty_errors
   errors.full_messages.join(".  ")
  end

  

end
