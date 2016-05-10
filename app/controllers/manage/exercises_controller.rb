class Manage::ExercisesController < Manage::BaseController
  def index
    @exercises = @studio.exercises
  end

  def update
    exercise_listing = ExerciseListing.new(exercise_listing_params)
    exercise_listing.save
    flash[:success] = 'Exercise listing has been successfully updated.'
    redirect_to manage_exercises_path
  end

  private
    def exercise_listing_params
      { studio: @studio, exercise_ids: params[:exercise_ids] || [] }
    end
end
