class CourseCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :course

  validates :course_id, presence: true, uniqueness: { scope: :category_id }
  validates :category_id, presence: true
  validate :course_exists
  validate :category_exists

  def self.added?(course_id, category_id)
    CourseCategory.all.exists?(course_id: course_id, category_id: category_id)
  end

  private

  def course_exists
    if Course.find_by(id: course_id).nil?
      errors.add(:course_id, 'Invalid Course')
    end
  end

  def category_exists
    if Category.find_by(id: category_id).nil?
      errors.add(:category_id, 'Invalid Category')
    end
  end
end
