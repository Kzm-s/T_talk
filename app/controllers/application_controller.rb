class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :birth, :gender, :affiliation, :job_title, :career, :responsible, :subject, :grade, :other, :admin, position_ids: []])
  end
end
