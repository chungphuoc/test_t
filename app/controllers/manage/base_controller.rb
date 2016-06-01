class Manage::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_studio!
  before_action :prepare_studio
  layout 'studio'

  def translation_scope
    "manage.#{controller_name}"
  end

  private

  def prepare_studio
    @studio = current_user.role
  end

  def authenticate_studio!
    return if current_user.studio?
    set_flash_message :notice, :access_denied, scope: :error
    redirect_to root_path
  end
end
