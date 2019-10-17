class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name self_introduction sex hobby img_name))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name self_introduction sex hobby img_name))
  end

  def after_sign_in_path_for(resource)
    root_path
  end
  def after_update_path_for(resource)
    root_path
  end
end
