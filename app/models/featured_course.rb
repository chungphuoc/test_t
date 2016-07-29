class FeaturedCourse < ActiveRecord::Base
  belongs_to :course

  validates :course_id, presence: true, uniqueness: true

  def self.added?(course_id)
    FeaturedCourse.all.exists?(course_id: course_id)
  end

  def self.get_limit_featured_course(limit = 3)
    FeaturedCourse.joins(:course)
                  .where(courses: {status: Course.statuses[:active]})
                  .limit(limit)
                  .map{ |featured_course| featured_course.course }
  end
end
