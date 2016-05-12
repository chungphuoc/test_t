class My::CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_customer!
  before_action :prepare_customer
  layout 'account'

  def show
    
  end

  def edit
    
  end

  def update
    @customer.user.update_attributes(user_params)
    if @customer.update_attributes(customer_params)
      flash[:notice] = "Update successfuly!"
      redirect_to my_customer_path
    else
      render :edit
    end
  end

  private

  def authenticate_customer!
    unless current_user.customer?
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end

  def prepare_customer
    @customer = current_user.role
  end

  def customer_params
    params.require(:customer).permit(:gender, :birthday, :receive_sms)
  end
  def user_params
    params.require(:customer).require(:user_attributes).permit(:name, :contact_number, :address, :avatar)
  end
end
