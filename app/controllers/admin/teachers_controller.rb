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
      flash[:success] = 'Create Teacher successful!'
      redirect_to admin_teachers_path
    else
      flash[:error] = 'Cannot create Teacher.'
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
      flash[:success] = 'Update Teacher successful!'
      redirect_to admin_teachers_path
    else
      flash[:error] = 'Can not update Teacher.'
      render :edit
    end
  end

  def destroy
    if @teacher.destroy
      flash[:success] = 'Delete Teacher successful!'
    else
      flash[:error] = 'Can not delete Teacher.'
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
