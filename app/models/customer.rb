class Customer < ActiveRecord::Base
  has_one :user, as: :role
  has_many :enrollments, dependent: :destroy
  has_many :courses_enrollments, through: :enrollments, source: :course do
    def filter(statuses)
      where('enrollments.status IN (?)', statuses)
    end
  end
  has_many :favourite_courses
  has_many :courses_favourites, through: :favourite_courses, source: :course
  delegate :email, to: :user
  delegate :name, to: :user
  accepts_nested_attributes_for :user
  LOYALTY_POINT = 2
  LOYALTY_CUSTOMER = 1
  enum gender: { male: 'Male', female: 'Female' }

  def self.gender
    [['Male', :male], ['Female', :female]]
  end
end
