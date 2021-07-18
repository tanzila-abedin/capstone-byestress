class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :fullname, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :fullname, :email, :password, :current_password)
    end
  end

  def posts_for_all
    # n+1 query
    @my_posts = current_user.microposts.includes(:user)
    @friends = Following.includes(:follower).where(follower_id: current_user.id)

    @my_friends_posts = []
    @friends.each do |friendship|
      user = User.find_by(id: friendship.followed_id)
      @my_friends_posts << user.microposts
    end
  end
end
