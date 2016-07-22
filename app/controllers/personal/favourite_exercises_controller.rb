class Personal::FavouriteExercisesController < Personal::BaseController
  before_action :require_permission!, only: :remove
  before_action :prepare_favourite_exercise, only: :remove

  def add
    @exercise_id = params[:exercise_id]
    current_user.favourite_exercises.create(exercise_id: params[:exercise_id])
  end

  def remove
    return unless @favourite_exercise
    @exercise_id = params[:exercise_id]
    @favourite_exercise.destroy
  end

  private

  def require_permission!
    return redirect_to :back if current_user.role_id != params[:customer_id].to_i
  end

  def prepare_favourite_exercise
    @favourite_exercise = FavouriteExercise.find_by_customer_id_and_exercise_id(params[:customer_id],
                                                                             params[:exercise_id])
  end
end
