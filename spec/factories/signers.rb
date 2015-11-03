
FactoryGirl.define do 
  factory :signer do
    first_name "John"
    last_name "Doe"
    sequence(:email) { |n| "johndoe#{n}@example.com"}
    country "US"
  end 
end