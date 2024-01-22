class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include DateHelper
  layout :set_layout
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role_id])
  end

  private

  def set_layout
    if user_signed_in?
      "admin"
    else  
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    pages_dashboard_path
  end

  def after_sign_up_path_for(resource)
    pages_dashboard_path
  end
  
end
