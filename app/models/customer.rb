class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments
end
