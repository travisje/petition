require 'rails_helper'

describe Signer do
  it "is valid with a first name, last name, email, and country" do
    signer = Signer.new(
      first_name: "Sam",
      last_name: "Brown",
      email: "sbrown@msns.com",
      country: "US")
    expect(signer).to be_valid
  end

  it "is invalid without a first name" do
    signer = Signer.new(first_name: nil)
    signer.valid?
    expect(signer.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    signer = Signer.new(last_name: nil)
    signer.valid?
    expect(signer.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without a country" do
    signer = Signer.new(country: "")
    signer.valid?
    expect(signer.errors[:country]).to include("can't be blank")
  end

  it "is invalid without a email" do
    signer = Signer.new(email: nil)
    signer.valid?
    expect(signer.errors[:email]).to include("can't be blank")
  end


  it "is invalid with a duplicate email address" do
    Signer.create(first_name: "Travis", last_name: "Smith", country: "US", email: "example@example.com")
    signer = Signer.new(first_name: "Mike", last_name: "McDaniels", country: "US", email: "example@example.com")
    signer.valid?
    expect(signer.errors[:email]).to include("address has already been used for sign up. Please enter a valid Email address.")
  end

  it "is invalid with a duplicate email address with different capitalization" do
    Signer.create(first_name: "Travis", last_name: "Smith", country: "US", email: "example@example.com")
    signer = Signer.new(first_name: "Mike", last_name: "McDaniels", country: "US", email: "Example@example.com")
    signer.valid?
    expect(signer.errors[:email]).to include("address has already been used for sign up. Please enter a valid Email address.")
  end
end