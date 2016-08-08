class Manage::PaymentController < Manage::BaseController
  def index
    @enrollments = Enrollment.includes(course: [ :studio ])
                            .page(params[:page])
    @total_payment = cal_total_payment(@enrollments)
  end

  def year_filter
    @year = params[:year]
    @enrollments = Enrollment.where("extract(year from created_at) =?", @year).page(params[:page])
    @total_payment = cal_total_payment(@enrollments)
    render 'payment_table', layout: false
  end

  def month_filter
    @year = params[:year]
    @month = params[:month]
    @enrollments = if @month.to_i == 0
                      Enrollment.where("extract(year from created_at) =?", @year).page(params[:page])
                    else
                      Enrollment.where("extract(year from created_at) =? AND extract(month from created_at) =?", @year, @month).page(params[:page])
                    end
    @total_payment = cal_total_payment(@enrollments)
    render 'payment_table', layout: false
  end

  private

  def cal_total_payment(enrollments)
    return 0 if enrollments.nil?
    enrollments.map { |enrollment| enrollment.course.tuition }.inject(0, :+)
  end
end
