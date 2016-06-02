class Personal::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_customer!
  layout 'personal'

  def translation_scope
    "personal.#{controller_name}"
  end

  def authenticate_customer!
    return if current_user.customer?
    set_flash_message :notice, :access_denied, scope: :error
    redirect_to root_path
  end
end
