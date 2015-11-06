
def random_boolean
  [true,false].sample
end


FactoryGirl.define do 
  factory :signer do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    country {Faker::Address.country_code}
    occupation {Faker::Lorem.word}
    comment {Faker::Lorem.sentence}
    display_sig random_boolean
    subscribe random_boolean

    factory :invalid_signer do
      first_name nil
    end
  end

end