class FollowingsController < ApplicationController
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
    return flash[:danger] = 'Please log in.' unless logged_in?

    redirect_to login_url
  end

  def logged_in?
    !current_user.nil?
  end
end
