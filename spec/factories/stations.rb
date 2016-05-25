FactoryGirl.define do
  sequence(:location) { |n| "#{Faker::Address.street_address} #{n}" }
  factory :station do
    name Faker::Name.name
    location
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
  end
end
