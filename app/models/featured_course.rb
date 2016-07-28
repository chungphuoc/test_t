class FeaturedCourse < ActiveRecord::Base
  belongs_to :course

  def self.added?(course_id)
    FeaturedCourse.all.exists?(course_id: course_id)
  end
end
