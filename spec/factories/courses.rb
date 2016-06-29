FactoryGirl.define do
  factory :course do
    name
    phone_number '0123456789'
    num_slot 10
    start_date Date.current
    association :teacher, factory: :teacher
    association :station, factory: :station
    association :exercise, factory: :exercise
    website Faker::Internet.url
    kcal 10
    tuition 10
  end
end