class Manage::TeachersController < Manage::BaseController
  before_action :prepare_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = @studio.teachers
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      @studio.teachers << @teacher
      flash[:success] = 'Teacher has been successfully created'
      redirect_to manage_teacher_path(@teacher)
    else
      flash.now[:error] = 'Error!'
      render :new
    end
  end

  def edit
  end

  def update
    @teacher.assign_attributes(teacher_params)
    if @teacher.save
      flash[:success] = 'Teacher has been successfully updated'
      redirect_to manage_teacher_path(@teacher)
    else
      flash.now[:error] = 'Error!'
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to manage_teachers_url
  end

  private
    def prepare_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:name)
    end
end
