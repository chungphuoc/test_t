class Personal::EnrollmentsController < Personal::BaseController
  def index
    @enrollments = EnrollmentsQuery.new(current_user).by_statuses(params[:statuses] || [])
                           .page params[:page]
  end

  def create
    @enrollment = current_user.enrollments.new(course_id: params[:course_id])
    if @enrollment.save
      flash[:notice] = 'Add class successful!'
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

  def calories_burnt
    calories_burnt = EnrollmentsQuery.new(current_user).calories_burnt(params[:frequency])
    render text: calories_burnt.to_s
  end
end
