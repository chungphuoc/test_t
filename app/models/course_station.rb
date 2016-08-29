class CourseStation < ActiveRecord::Base
  belongs_to :course
  belongs_to :station
end
