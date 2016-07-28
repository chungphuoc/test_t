class FeaturedCourse < ActiveRecord::Base
  belongs_to :course

  validates :course_id, presence: true, uniqueness: true

  def self.added?(course_id)
    FeaturedCourse.all.exists?(course_id: course_id)
  end
end
