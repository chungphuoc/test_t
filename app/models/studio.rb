class Studio < ActiveRecord::Base
  belongs_to :user
  has_many :courses
  has_many :teachers, through: :courses
  has_many :stations, through: :courses
  has_many :exercises, through: :courses
end
