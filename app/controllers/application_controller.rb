class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if User.count == 1
        resource.add_user.role 'admin'
      end
      resource
    end
    root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  layout :layout_by_resource
  protected
  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
  before_action :set_locale

 def set_locale
   I18n.locale = params[:locale] || I18n.default_locale
 end
end
