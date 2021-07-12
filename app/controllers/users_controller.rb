class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :authenticate_user!
  
  def index
  @users = User.all
  end

  def new
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
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