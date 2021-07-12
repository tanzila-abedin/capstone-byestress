module UsersHelper
 # return true if the user is logged  in or falsw otherwise.
  def logged_in?
    !current_user.nil?
  end

  def me?(user)
    current_user == user
  end

end
