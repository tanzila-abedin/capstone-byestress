module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar')
  end

  def logged_in_user
    retrun flash[:danger] = 'Please log in.' unless logged_in?
    redirect_to login_url
  end

  def logged_in?
    !current_user.nil?
  end

  def me?(user)
    current_user == user
  end
end
