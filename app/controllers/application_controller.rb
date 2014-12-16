class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_admin!
    authenticate_user!
    unless current_user.try(:admin?)
      render text: "Not authorized", status: 403
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
