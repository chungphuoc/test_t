class Admin::ExercisesController < Admin::BaseController
  before_action :prepare_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
  end

  def show
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      set_flash_message :success, :created
      redirect_to admin_exercises_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :new
    end
  end

  def new
    @exercise = Exercise.new
  end

  def update
    if @exercise.update_attributes(exercise_params)
      set_flash_message :success, :updated
      redirect_to admin_exercises_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :edit
    end
  end

  def destroy
    if @exercise.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
    end
    render :back
  end

  private

  def prepare_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description)
  end
end
