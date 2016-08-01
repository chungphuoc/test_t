class Category < ActiveRecord::Base
  has_many :course_categories, dependent: :destroy
  has_many :courses, through: :course_categories, source: :course

  validates :name, presence: true, uniqueness: true

  def self.create_default
    Category.create(name: 'Featured Courses')
    Category.create(name: 'Popular Courses')
    Category.create(name: 'Event Courses')
    Category.create(name: 'New Courses')
  end
end
