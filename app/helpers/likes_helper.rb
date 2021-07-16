# frozen_string_literal: true

module LikesHelper
  def like_post?(post)
    current_user.liked_posts.include?(post)
  end
end
