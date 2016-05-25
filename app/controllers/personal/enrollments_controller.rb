class Personal::EnrollmentsController < Personal::BaseController
  def index
    @courses = CoursesQuery.new(current_user).enrollments_statuses(params[:statuses] || [])
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
    frequency = params[:frequency]
    calories_burnt = EnrollmentsQuery.new(current_user).calories_burnt(frequency)
    render text: calories_burnt.to_s
  end
end
