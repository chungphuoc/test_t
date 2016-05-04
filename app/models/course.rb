class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :station
  belongs_to :exercise
  belongs_to :studio
  has_many :enrollments
  has_many :customers, through: :enrollments
end
