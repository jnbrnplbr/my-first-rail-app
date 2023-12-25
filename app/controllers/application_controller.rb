class ApplicationController < ActionController::Base
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
end
