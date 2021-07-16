class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy
                                          following followers]
  before_action :authenticate_user!

  def index
    # n+1 qurey
    @users = User.all.includes(:following)
  end

  def new; end

  def show
    @user = User.find_by(id: params[:id])
    @micropost = Micropost.new
    # n+1 query
    @user_post = @user.microposts.includes(:likers)
    @user_likes = @user.likes
    @users = @user.following
    @users_followers = @user.followers
  end

  private

  def logged_in_user
    unless logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def me?(user)
    current_user == user
  end

  def user_params
    params.require(:user).permit(:username, :fullname, :email)
  end
end
