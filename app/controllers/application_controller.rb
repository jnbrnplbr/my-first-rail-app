class ApplicationController < ActionController::Base
  include DateHelper
  layout :set_layout
  protect_from_forgery with: :exception

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
