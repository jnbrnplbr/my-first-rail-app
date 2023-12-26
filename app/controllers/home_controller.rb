class HomeController < ApplicationController
  before_action :check_signed_in

  def check_signed_in
    redirect_to pages_dashboard_path if user_signed_in?
  end


  def index
  end

  def about
  end
end
