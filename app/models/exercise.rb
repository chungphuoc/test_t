class Exercise < ActiveRecord::Base
  has_many :courses
  has_many :studios, through: :courses
end
