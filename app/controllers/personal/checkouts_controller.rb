class Personal::CheckoutsController < ApplicationController
  def process(variable)
    customer = Stripe::Customer.create email: params[:stripeEmail],
                                       card: params[:stripeToken] 
    Stripe::Charge.create customer: customer.id,
                          amount: params[:tuition].to_i * 100,
                          description: params[:course_name],
                          currency: params[:currency]
    @enrollment = Enrollment.by_customer_and_course(current_user.role, Course.find(params[:course_id]))
    @enrollment.change_status(Enrollment::STATUS_PAID)
    redirect_to :back
  end
end

