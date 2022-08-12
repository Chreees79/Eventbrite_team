module AdminsHelper
  def app_admin?
    return false unless user_signed_in?
    return true if current_user.app_admin == true
  end
end
