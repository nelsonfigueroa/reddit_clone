class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # permit parameters for devise sign up page
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :password)
    end
  end
end
