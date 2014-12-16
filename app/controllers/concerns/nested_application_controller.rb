module NestedApplicationController
  extend ActiveSupport::Concern

  included do
    before_action :set_application
  end

  def set_application
    if params[:application_id].present?
      @application = Application.find(params[:application_id])
    end
  end
end