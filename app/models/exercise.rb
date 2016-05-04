class Exercise < ActiveRecord::Base
  has_many :courses
  has_many :services, dependent: :destroy
  has_many :studios, through: :services
end
