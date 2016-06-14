class Manage::PaymentController < Manage::BaseController
  def index
    @enrollments = Enrollment.all
  end

  def year_filter
    @year = params[:year]
    @enrollments = Enrollment.where("extract(year from created_at) =?", @year)
    render 'payment_table', layout: false
  end

  def month_filter
    @year = params[:year]
    @month = params[:month]
    @enrollments = if @month.to_i == 0
                      Enrollment.where("extract(year from created_at) =?", @year)
                    else 
                      Enrollment.where("extract(year from created_at) =? AND extract(month from created_at) =?", @year, @month)
                    end
    render 'payment_table', layout: false
  end
end
