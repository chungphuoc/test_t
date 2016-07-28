class FavouriteExercise < ActiveRecord::Base
  validates_uniqueness_of :customer_id, scope: [:exercise_id]
  belongs_to :customer
  belongs_to :exercise

  def self.added?(current_user, exercise_id)
    current_user.favourite_exercises.exists?(exercise_id: exercise_id)
  end
end
