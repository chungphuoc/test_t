class ExerciseStudio < ActiveRecord::Base
  belongs_to :course
  belongs_to :exercise
  belongs_to :studio
end
