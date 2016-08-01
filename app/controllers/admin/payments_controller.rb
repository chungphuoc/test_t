class Admin::PaymentsController < Admin::BaseController
  def index
    @studios = Studio.includes(enrollments: [:course, :options])
                     .page(params[:page])
                     .per(5)
  end
end
