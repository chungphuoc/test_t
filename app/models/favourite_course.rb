class FavouriteCourse < ActiveRecord::Base
  validates_uniqueness_of :customer_id, scope: [:course_id]
  belongs_to :customer
  belongs_to :course

  def self.added?(current_user, course_id)
    current_user.favourite_courses.exists?(course_id: course_id)
  end
end
