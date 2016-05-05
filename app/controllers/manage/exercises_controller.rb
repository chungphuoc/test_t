class Manage::ExercisesController < Manage::BaseController
  before_action :prepare_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = @studio.exercises
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      @studio.exercises << @exercise
      flash[:success] = 'Exercise has been successfully created'
      redirect_to manage_exercise_path(@exercise)
    else
      flash.now[:error] = @exercise.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @exercise.assign_attributes(exercise_params)
    if @exercise.save
      flash[:success] = 'Exercise has been successfully updated'
      redirect_to manage_exercise_path(@exercise)
    else
      flash.now[:error] = @exercise.errors.full_messages
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to manage_exercises_url
  end

  private
    def prepare_exercise
      @exercise = Exercise.find(params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :description)
    end
end
