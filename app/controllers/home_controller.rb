class HomeController < ApplicationController
  before_filter :require_admin!, only: [:dashboard]
  def index
    if current_user.nil?
      @applications = Application.open
    else
      redirect_to applications_path
    end
  end
end