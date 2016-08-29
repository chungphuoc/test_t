FactoryGirl.define do
  factory :course_station do
    association :course
    association :station
  end
end
