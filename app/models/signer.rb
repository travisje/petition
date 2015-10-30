class Signer < ActiveRecord::Base
  
  require 'csv'

  validates :first_name, :last_name, presence: true
  validates :country, exclusion: {in: [""], message: "cannot be blank"}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true
  validates :email, uniqueness: {case_sensitive: false, message: "address has already been used for sign up. Please enter a valid Email address."}

  def self.custom_statements
    results = []
    CSV.foreach((Rails.root.join 'db','signer_statements.csv'), "r:ISO-8859-1") do |row|
      results << correct_apostrophe(row)
    end
    results.drop(1)
  end

  def self.correct_apostrophe(row)
    row.map do |element|
      element.gsub("Õ","'")
    end
  end

  def email=(email)
    write_attribute(:email, email.downcase)
  end

  def pretty_errors
   errors.full_messages.join(".  ")
  end

end
