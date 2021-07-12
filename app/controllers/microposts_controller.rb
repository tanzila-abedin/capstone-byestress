class MicropostsController < ApplicationController

  def index
      @micropost = Micropost.new
      timeline_posts
      @users = User.all
  end

  def create
    @micropost = current_user.microposts.new(post_params)
    @micropost.save
    redirect_to  root_path, notice: 'Post was successfully created.'
  end
  
  def new
  end

  private 

  def timeline_posts
    @my_posts = current_user.microposts
    @friends = Following.where(follower_id: current_user.id)

    @my_friends_posts = []
    @friends.each do |friendship|
      user = User.find_by(id: friendship.followed_id)
      @my_friends_posts << user.microposts
    end
    @timeline_posts = @my_posts + @my_friends_posts
    @timeline_posts.compact
  end

  def post_params
    params.require(:micropost).permit(:content)
  end
end
