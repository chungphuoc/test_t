class StudiosController < ApplicationController
  def new
    @studio = Studio.new
    @studio.build_user
  end

  def create
    @studio = Studio.new(studio_params)
    byebug
    if @studio.save
      flash[:notice] = "Account Successfully Created!, Please Login to Continue"
      redirect_to root_path
    else  
      render :new
    end
  end

  private

  def studio_params
    params.require(:studio).permit(:cover_img, :user_attributes => [:name, :email, :contact_number, :address, :avatar, :password, :password_confirmation])
  end
end
