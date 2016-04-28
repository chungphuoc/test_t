class Studio < ActiveRecord::Base
  belongs_to :user
  has_many :station_studios
  has_many :customer_courses
  has_many :classes
  has_many :exercise_studios
  has_many :teachers
end
