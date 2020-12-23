class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

# ↓これを追加↓
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :my_title, :img])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :my_title, :img])
    end
end
