class HomeController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_response_path
    else
      redirect_to dashboard_path
    end
  end

  def dashboard

  end
end