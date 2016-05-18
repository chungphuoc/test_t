class Personal::EnrollmentsController < Personal::BaseController

  def index
    #@enrollments = current_user.enrollments
    @courses = CoursesQuery.new(current_user).enrollments_statuses(params[:statuses]||[])
                           .paginate(:page => params[:page], :per_page => 9)
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
    @enrollment = Enrollment.find_by(id: params[:enrollment_id])
    if @enrollment
      @enrollment.update_attributes(status: :cancel)
      @enrollment.cancel_class_mailer
    end
    render nothing: true
  end

end
