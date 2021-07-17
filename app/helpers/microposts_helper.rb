module MicropostsHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end

  def me?(user)
    current_user == user
  end

  def follow?(other_user)
    current_user.following.include?(other_user)
  end

  # def tanzila
  #   @my_posts = current_user.microposts
  #   @friends = Following.where(follower_id: current_user.id)

  #   @my_friends_posts = []
  #   # n+1 query
  #   @friends.includes(:follower).each do |friendship|
  #     user = User.find_by(id: friendship.followed_id)
  #     @my_friends_posts << user.microposts
  #   end
  # end
end
