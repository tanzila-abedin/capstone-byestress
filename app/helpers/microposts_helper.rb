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
end
