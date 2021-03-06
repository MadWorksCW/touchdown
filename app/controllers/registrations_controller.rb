class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def new
    flash[:info] = 'Registrations are not open.'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Registrations are not open.'
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name)
  end

end