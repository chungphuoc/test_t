class Customer < ActiveRecord::Base
  has_one :user, as: :role
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments
  has_many :favourite_classes
  accepts_nested_attributes_for :user
  enum gender: {male: "Male", female: "Female"}

  def self.gender
    [["Male", :male], ["Female", :female]]
  end
end
