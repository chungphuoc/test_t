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
  delegate :address, to: :user
  delegate :contact_number, to: :user
  delegate :avatar, to: :user
  validates :point, numericality: {greater_than_or_equal_to: 0}
  validates :total_point, numericality: {greater_than_or_equal_to: 0}
  accepts_nested_attributes_for :user
  enum gender: [:male, :female]

  def self.gender
    [['Male', :male], ['Female', :female]]
  end

  def name_with_initial
    self.name
  end
end
