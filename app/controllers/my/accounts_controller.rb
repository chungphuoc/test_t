class My::AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :prepare_user
  def show
  end

  def edit
  end

  def update
  end

  private
  def authenticate_customer!
    unless current_user.role_type == 'Customer'
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end

  def prepare_user
      @customer = Customer.find(params[:id])
  end
end
