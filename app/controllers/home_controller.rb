class HomeController < ApplicationController
  before_filter :require_admin!, only: [:dashboard]
  def index
    if current_user.nil?
      redirect_to new_response_path
    elsif current_user.admin?
      redirect_to dashboard_path
    else
      redirect_to responses_path
    end
  end

  def dashboard
    @response_count = Response.count
    @scoring_completion = User.joins(:scores).select("users.*, count(scores.id) as score_count").group('users.id').collect do |user|
      [user.display_name, user.score_count]
    end

  end
end