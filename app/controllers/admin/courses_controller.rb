class Admin::CoursesController < Admin::BaseController
  before_action :prepare_course, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @courses.save
      flash[:success] = 'Add Class successful!'
      redirect_to admin_courses_path
    else
      flash[:error] = 'Can not add Class!'
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update_attributes(course_params)
      flash[:success] = 'Update Class successful!'
      redirect_to admin_courses_path
    else
      flash[:error] = 'Can not update class!'
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = 'Delete Class successful!'
      redirect_to admin_courses_path
    else
      flash[:error] = 'Can not delete Class!'
      redirect_to :back
    end
  end

  def change_studio
    @studio = Studio.find(params[:studio_id])
    if @studio
      @station_options = @studio.stations.collect { |station| [station.name, station.id] }
      @teacher_options = @studio.teachers.collect { |teacher| [teacher.name, teacher.id] }
      @exercise_options = @studio.exercises.collect { |exercise| [exercise.name, exercise.id] }
    else
      @station_options = @teacher_options = @exercise_options = []
    end
  end

  private

  def prepare_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :cover_img, :phone_number, :website, :description, :kcal, :num_slot, :start_time, :end_time, :start_date, :teacher_id, :station_id, :studio_id, :exercise_id, :tuition, :currency, :days_of_week)
  end
end
