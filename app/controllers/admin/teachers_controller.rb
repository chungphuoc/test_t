class Admin::TeachersController < Admin::BaseController
  before_action :prepare_teacher, only: [:show, :edit, :destroy, :update]

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      set_flash_message :success, :created
      redirect_to admin_teachers_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :new
    end
  end

  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def update
    if @teacher.update_attributes(teacher_params)
      set_flash_message :success, :updated
      redirect_to admin_teachers_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :edit
    end
  end

  def destroy
    if @teacher.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
    end
    redirect_to :back
  end

  private

  def prepare_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
