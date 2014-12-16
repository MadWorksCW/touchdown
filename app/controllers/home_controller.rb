class HomeController < ApplicationController
  before_filter :require_admin!, only: [:dashboard]
  def index
    if current_user.nil?
      @applications = Application.open
    elsif current_user.admin?
      redirect_to applications_path
    else
      redirect_to application_responses_path(@application)
    end
  end
end