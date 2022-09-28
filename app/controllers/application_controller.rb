class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :email, :password, :password_confirmation, :birth, :gender, :affiliation, :job_title, :career, :responsible, :subject, :grade, :other, :introduction, position_ids: []])
  end
end
