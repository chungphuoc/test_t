class Personal::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_customer!
  layout 'personal'

  def authenticate_customer!
    unless current_user.customer?
      flash[:notice] = 'Access Denied'
      redirect_to root_path
    end
  end
end
