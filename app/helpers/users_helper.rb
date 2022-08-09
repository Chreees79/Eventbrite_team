module UsersHelper
  def find_user_id
    User.find(params[:id])
  end
end
