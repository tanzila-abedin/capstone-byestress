# frozen_string_literal: true

class AddIndexToLikes < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, %i[user_id micropost_id], unique: true
  end
end
