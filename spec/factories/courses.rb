FactoryGirl.define do
  factory :course do
    association :course_type
    num_slot 10
    start_date Date.current
    association :teacher, factory: :teacher
    association :exercise, factory: :exercise
    kcal 10
    tuition 10
    days_of_week [1]

    before(:create) do |course|
      course.stations << FactoryGirl.create(:station)
    end
  end
end
