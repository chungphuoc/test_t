class Service < ActiveRecord::Base
  belongs_to :studio
  belongs_to :exercise

  validates_uniqueness_of :exercise_id, scope: [:studio_id], message: 'Exercise has already been added.'
end
