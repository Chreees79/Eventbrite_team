class Admins::UsersController < ApplicationController
  require_relative '../../helpers/users_helper'
  before_action :require_admin

  def edit
    @user = find_user_id
  end

  def update
    find_user_id.update(user_params)
    redirect_to admins_path
  end

  def destroy
    find_user_id.destroy
    redirect_to admins_path
  end

  def require_admin
    unless current_user.app_admin?
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email)
  end
end
