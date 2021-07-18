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
    @user_post = @user.microposts.includes(:user, :likers)
    @user_likes = @user.likes
    @users = @user.following
    @users_followers = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :email)
  end
end
