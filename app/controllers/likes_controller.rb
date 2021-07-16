# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    micropost = Micropost.find_by(id: params[:format].to_i)
    current_user.liked_posts << micropost
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, micropost_id: params[:id])
    like.delete
    redirect_to root_path
  end
end
