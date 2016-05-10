class ExerciseListing
  include ActiveModel::Model

  attr_accessor :studio, :exercise_ids

  def initialize(params = {})
    super(params)
  end

  def save
    destroyed_exercises = @studio.exercises.where.not(id: @exercise_ids)
    new_exercises = Exercise.where(id: (@exercise_ids - @studio.exercises.pluck(:id)))
    @studio.exercises.destroy(destroyed_exercises)
    new_exercises.each { |exercise| @studio.exercises << exercise }
  end

end