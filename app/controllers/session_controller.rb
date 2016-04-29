class SessionController < ApplicationController
  def new
    @user = User.new
    if user_signed_in?
      redirect_to root_path
    end
  end

  def create
    if @user = User.find_by_email(params[:user][:email])
      if @user.valid_password?(params[:user][:password])
        sign_in @user
        flash[:notice] = "You are signed in."
        redirect_to studio_manage_index_path
      else
        flash[:alert] = "Invalid password."
        redirect_to login_path
      end
    else
      flash[:alert] = "Invalid email."
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    flash[:notice] = "Sign out successful!"
    redirect_to root_path
  end
end
