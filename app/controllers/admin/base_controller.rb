class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  layout 'admin'

  def authenticate_admin!
    return if current_user.admin?
    set_flash_message :notice, :access_denied, scope: :error
    redirect_to root_path
  end

  def translation_scope
    "admin.#{controller_name}"
  end
end
