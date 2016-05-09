class CustomersController < ApplicationController
  def show
    
  end

  def new

  end

  def edit
    
  end

  def update
    
  end

  private


  def studio_params
    params.require(:customer).permit(:cover_img, user_attributes: [:name, :email, :contact_number, :address, :avatar, :password, :password_confirmation])
  end
end
