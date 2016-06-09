class Admin::EnrollmentsController < Admin::BaseController
  before_action :prepare_enrollment, only: [:show, :update, :destroy, :edit]
  def index
    @enrollments = Enrollment.all.page(params[:page])
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
      set_flash_message :success, :updated
      redirect_to :back
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :edit
    end
  end

  def destroy
    if @enrollment.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
    end
    redirect_to :back
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      set_flash_message :success, :created
      redirect_to :back
    else
      set_flash_message :error, :error, scope: :error, now: true
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
