class HomeController < ApplicationController
  before_filter :require_admin!, only: [:dashboard]
  def index
    if current_user.nil?
      @applications = Application.open
      if @applications.count == 1
        redirect_to new_application_response_path(@applications.first)
      end
    else
      redirect_to applications_path
    end
  end

  def dashboard

  end
end