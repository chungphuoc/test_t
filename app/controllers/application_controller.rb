class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def after_sign_in_path_for(resource)
    if resource.studio?
      manage_courses_path
    else
      my_customer_path
    end
  end

  def set_locale
    I18n.locale = if user_signed_in?
      current_user.locale
    else
      I18n.default_locale
    end
  end
end
