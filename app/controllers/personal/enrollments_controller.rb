class Personal::EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_customer!

  def index
    @enrollments = Enrollment.all.where(customer_id: current_user.role_id)
  end

  def create
    @enrollment = Enrollment.new(customer: current_user.role, course: Course.find(params[:course_id]))
    if @enrollment.save
      flash[:notice] = "Add class successful!"  
      redirect_to personal_enrollments_path
    else
      flash[:notice] = "Error!"  
      redirect_to personal_enrollments_path
    end
  end

  def cancel
    @enrollment = Enrollment.find(params[:enrollment_id])
    if @enrollment
      @enrollment["status"] = 2
      @enrollment.save
      @enrollment.cancel_class_mailer
    end
    render nothing: true
  end

  private

  def authenticate_customer!
    unless current_user.role_type == 'Customer'
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end
end
