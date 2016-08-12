class Manage::PaymentController < Manage::BaseController
  def index
    @enrollments = @studio.enrollments
                          .includes(course: [:studio])
                          .page(params[:page])
    @total_payment = cal_total_payment(@enrollments)
    @has_slidebar = false
  end

  def year_filter
    @year = params[:year]
    @enrollments = Enrollment.find_enrollment_by_year(params[:year], @studio)
                             .includes(course: [:studio])
                             .page(params[:page])
    @total_payment = cal_total_payment(@enrollments)
    render 'payment_table', layout: false
  end

  def month_filter
    @enrollments = Enrollment.find_enrollment_by_month(filter_params, @studio)
                             .includes(course: [:studio])
                             .page(params[:page])
    @total_payment = cal_total_payment(@enrollments)
    render 'payment_table', layout: false
  end

  private

  def cal_total_payment(enrollments)
    return 0 if enrollments.nil?
    enrollments.map { |enrollment| enrollment.course.tuition }.inject(0, :+)
  end

  def filter_params
    params.permit(:month, :year)
  end
end
