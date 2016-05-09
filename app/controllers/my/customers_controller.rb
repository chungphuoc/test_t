class My::CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_customer!
  before_action :prepare_customer

  def show
    
  end

  def edit
    
  end

  def update
    @customer.user.update_attributes(user_params)
    customer_params[:birthday] = DateTime.new(params[:customer]["birthday(1i)"].to_i, params[:customer]["birthday(2i)"].to_i, params[:customer]["birthday(3i)"].to_i)
    if @customer.update_attributes(customer_params)
      flash[:notice] = "Update successfuly!"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def authenticate_customer!
    unless current_user.role_type == 'Customer'
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
