class Admin::EnrollmentsController < Admin::BaseController
  before_action :prepare_enrollment, only: [:show, :update, :destroy, :edit]
  def index
    @enrollments = Enrollment.all
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def edit
  end

  def update
    if @enrollment.update_attributes(enrollment_params)
      flash[:success] = 'Enrollment successful updated!'
      redirect_to :back
    else
      flash[:error] = 'Can not update Enrollment!'
      render :edit
    end
  end

  def destroy
    if @enrollment.destroy
      flash[:success] = 'Delete Enrollment successful!'
    else
      flash[:error] = 'Cannot delete Enrollment!'
    end
    redirect_to :back
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      flash[:success] = 'Enrollment successful created!'
      redirect_to :back
    else
      flash[:error] = 'Can not create Enrollment!'
      render :new
    end
  end

  def change_course
    @course = Course.find(params[:course_id])
    @time_options = if @course
                      @course.slot_time
                    else
                      @time_options = []
                    end
  end

  private

  def prepare_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:customer_id, :course_id, :status, :join_date)
  end
end