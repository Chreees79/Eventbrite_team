module UsersHelper
  def find_user_id
    User.find(params[:id])
  end

  def is_user?
    if current_user == find_user_id
      return true
    end
  end
end
