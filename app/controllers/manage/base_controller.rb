class Manage::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_studio!
  before_action :prepare_studio
  layout 'studio'

  private

  def prepare_studio
    @studio = current_user.role
  end

  def authenticate_studio!
    return if current_user.studio?
    flash[:notice] = 'Access Denied'
    redirect_to root_path
  end
end
