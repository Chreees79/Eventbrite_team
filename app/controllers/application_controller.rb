class ApplicationController < ActionController::Base
  include EventsHelper
  include UsersHelper
  include AttendancesHelper
  include AdminsHelper
  include ApplicationHelper 
  add_flash_types :info, :error, :success, :alert
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password)
    end
  end

  def authorize_admin
    if user_signed_in?
      redirect_to root_path, status: 401 unless current_user.app_admin
    else
      redirect_to new_user_session_path
    end
    # redirects to previous page
  end
end
