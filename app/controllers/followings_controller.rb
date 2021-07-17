class FollowingsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find(params[:following][:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Following.find(params[:id]).followed
    current_user.unfollows(user)
    redirect_to user
  end

  private

  def logged_in_user
    if !logged_in?

      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
