class Manage::CourseTypesController < Manage::BaseController
  before_action :prepare_course_type, only: [:edit, :update, :destroy]
  def index
    @course_types = @studio.course_types.includes(:courses)
  end

  def new
    @course_type = @studio.course_types.new
  end

  def create
    @course_type = @studio.course_types.new(course_type_params)
    if @course_type.save
      set_flash_message :success, :created
      redirect_to manage_course_types_path
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :new
    end
  end

  def edit
  end

  def update
    if @course_type.update_attributes(course_type_params)
      set_flash_message :success, :updated
      redirect_to manage_course_types_path
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :edit
    end
  end

  def destroy
    if @course_type.destroy
      set_flash_message :success, :removed
      redirect_to manage_course_types_path
    else
      flash[:error] = @course_type.errors.full_messages.join(', ')
      redirect_to manage_course_types_path
    end
  end

  private
  def course_type_params
    params.require(:course_type).permit(:name)
  end

  def prepare_course_type
    @course_type = @studio.course_types.find(params[:id])
  end
end
