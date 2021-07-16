# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_714_095_212) do
  enable_extension 'plpgsql'

  create_table 'followings', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['followed_id'], name: 'index_followings_on_followed_id'
    t.index %w[follower_id followed_id], name: 'index_followings_on_follower_id_and_followed_id', unique: true
    t.index ['follower_id'], name: 'index_followings_on_follower_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'micropost_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['micropost_id'], name: 'index_likes_on_micropost_id'
    t.index %w[user_id micropost_id], name: 'index_likes_on_user_id_and_micropost_id', unique: true
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'microposts', force: :cascade do |t|
    t.text 'content'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[user_id created_at], name: 'index_microposts_on_user_id_and_created_at'
    t.index ['user_id'], name: 'index_microposts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'username'
    t.string 'fullname'
    t.string 'photo'
    t.string 'coverimage'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'likes', 'microposts'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'microposts', 'users'
end
