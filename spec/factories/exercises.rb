FactoryGirl.define do
  sequence(:name) { |n| "#{Faker::Name.name} #{n}" }
  factory :exercise do
    name
    description Faker::Lorem.sentence
  end
end
