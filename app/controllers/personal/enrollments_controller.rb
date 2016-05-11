class Personal::EnrollmentsController < Personal::BaseController

  def index
    #@enrollments = Enrollment.all.where(customer_id: current_user.role_id)
    #@enrollments = current_user.role.enrollments
    @enrollments = current_user.enrollments
  end

  def create
    @enrollment = current_user.enrollments.new(course_id: params[:course_id])
    if @enrollment.save
      flash[:notice] = "Add class successful!"  
      redirect_to personal_enrollments_path
    else
      flash[:notice] = @enrollment.errors.full_messages[0]  
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

end
