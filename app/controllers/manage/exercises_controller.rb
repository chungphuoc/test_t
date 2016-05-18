class Manage::ExercisesController < Manage::BaseController
  def index
    @exercise_ids = @studio.exercises.pluck(:id)
  end

  def update
    StudioExerciseService.new(@studio).update_exercises(params[:exercise_ids].to_a)
    flash[:success] = 'Exercise listing has been successfully updated.'
    redirect_to manage_exercises_path
  end
end
