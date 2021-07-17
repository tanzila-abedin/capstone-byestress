class MicropostsController < ApplicationController
  def index
    @micropost = Micropost.new
    timeline_posts
    @users = User.all
  end

  def create
    @micropost = current_user.microposts.new(post_params)

    if @micropost.save
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      redirect_to root_path, alert: 'Cannot create blank post.'
    end
  end

  def new; end

  private

  def timeline_posts
    posts_for_all
    @timeline_posts = @my_posts + @my_friends_posts
    @timeline_posts.compact
  end

  def post_params
    params.require(:micropost).permit(:content)
  end
end
