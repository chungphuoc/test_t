class FavouriteClass < ActiveRecord::Base
  validates_uniqueness_of :customer_id, :scope => [:course_id] 

  def self.added?(current_user, course_id)
    current_user.favourite_classes.exists?(course_id: course_id)
  end
end
