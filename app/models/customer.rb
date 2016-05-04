class Customer < ActiveRecord::Base
  has_one :user, as: :role
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments
  accepts_nested_attributes_for :user
end
