FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    name Faker::Name.name
    password 'password123'
    password_confirmation 'password123'
    confirmed_at Time.now
    contact_number '0123456789'
    address Faker::Lorem.characters(22)
  end

  trait :admin do
    role_type 'Admin'
  end

  trait :customer do
    role_type 'Customer'
  end

  trait :studio do
    role_type 'Studio'
  end
end
