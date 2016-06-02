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
      flash[:success] = 'Create Exercise successful!'
      redirect_to admin_exercises_path
    else
      flash[:error] = 'Can not create Exercise'
      render :new
    end
  end

  def new
    @exercise = Exercise.new
  end

  def update
    if @exercise.update_attributes(exercise_params)
      flash[:success] = 'Update Exercise successful!'
      redirect_to admin_exercises_path
    else
      flash[:error] = 'Can not update Exercise'
      render :edit
    end
  end

  def destroy
    if @exercise.destroy
      flash[:success] = 'Delete Exercise successful!'
    else
      flash[:error] = 'Can not delete Exercise'
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
