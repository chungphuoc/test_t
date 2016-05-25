class Personal::CheckoutsController < ApplicationController
  def process_payment
    @customer = current_user.role
    @course = Course.find(params[:course_id])
    @enrollment = current_user.enrollments.new(course_id: params[:course_id])
    if @enrollment.save
      customer = Stripe::Customer.create(email: params[:stripeEmail],
                                         card: params[:stripeToken])
      charge = Stripe::Charge.create(customer: customer.id,
                            amount: params[:tuition].to_i * 100,
                            description: params[:course_name],
                            currency: params[:currency])
      # @enrollment = Enrollment.by_customer_and_course(@customer, @course)
      @enrollment.change_status(Enrollment::STATUS_PAID)
      new_point = (params[:tuition].to_i/100).round
      @customer.increment(:total_point, new_point)
      @customer.increment(:point, new_point)
      @customer.save
      flash[:notice] = 'Book class successful!'
      redirect_to :back
    else
      flash[:notice] = 'Cannot book this class!'
      redirect_to :back
    end
  end
end
