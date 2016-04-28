class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :studio
  belongs_to :exercise_studio
  belongs_to :customer_course
end
