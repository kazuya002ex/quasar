class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :my_title, :img, :nickname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :my_title, :img, :nickname])
    end
end
