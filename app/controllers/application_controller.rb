class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_studios_path
    elsif resource.studio?
      manage_courses_path
    else
      my_customer_path
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  rescue I18n::InvalidLocale
    I18n.locale = I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end
end
