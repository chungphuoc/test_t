class StudiosController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :authenticate_studio!, only: [:show, :edit, :update]
  before_action :prepare_studio, only: [:show, :edit, :update]

  def show
    
  end

  # def new
  #   @studio = Studio.new
  #   @studio.build_user
  # end

  # def create
  #   @studio = Studio.new(studio_params)
  #   if @studio.save
  #     flash[:notice] = "Account successfully created!, please login to continue"
  #     redirect_to root_path
  #   else  
  #     render :new
  #   end
  # end

  def edit
    
  end

  def update
    
  end

  private

  def authenticate_studio!
    unless current_user.role_type == 'Studio'
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end

  def prepare_studio
      @studio = Studio.find(params[:id])
  end

  def studio_params
    params.require(:studio).permit(:cover_img, user_attributes: [:name, :email, :contact_number, :address, :avatar, :password, :password_confirmation])
  end
end
