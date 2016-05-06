class Manage::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_studio!
  before_action :prepare_studio

  private
    def prepare_studio
      @studio = current_user.role
    end

    def authenticate_studio!
      unless current_user.role_type == 'Studio'
        flash[:notice] = "Access Denied"
        redirect_to root_path
      end
    end
end
