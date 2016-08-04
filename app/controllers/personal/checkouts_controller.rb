class Personal::CheckoutsController < ApplicationController
  def process_payment
    @enrollment = current_user.enrollments.new(course_id: params[:course_id],
                                               join_date: params[:join_date])
    add_payable_option
    @payment_service = PaymentService.new(current_user)
    if @enrollment.save
      @payment_service.save_payment_info(params)
      @payment_service.update_customer_info(params)
      flash[:success] = t('personal.checkouts.checkout_success')
      redirect_to confirmation_personal_enrollments_path(course_id: params[:course_id])
    else
      flash[:error] = @enrollment.errors.full_messages[0]
      redirect_to :back
    end
  end

  private

  # add payable option to enrollment
  def add_payable_option
    if params[:payable_option].present?
      params[:payable_option].each do |option_id|
        @enrollment.options << PayableOption.find(option_id)
      end
    end
  end
end
