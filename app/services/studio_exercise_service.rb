class StudioExerciseService
  def initialize(studio)
    @studio = studio
  end

  def update_exercises(exercise_ids)
    exercise_ids = exercise_ids.collect{|s| s.to_i}
    destroyed_exercises = @studio.exercises.where.not(id: exercise_ids)
    new_exercises = Exercise.where(id: (exercise_ids - @studio.exercises.pluck(:id)))
    @studio.exercises.destroy(destroyed_exercises)
    new_exercises.each { |exercise| @studio.exercises << exercise }
  end
end
