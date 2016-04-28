class Station < ActiveRecord::Base
  has_many :classes
  has_many :exercise_studios
  has_many :teachers
  has_many :station_studio
end
