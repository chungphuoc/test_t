FactoryGirl.define do
  factory :course_type do
    name
    association :studio
  end
end
