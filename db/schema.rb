# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_205_030_446) do
  create_table 'comments', force: :cascade do |t|
    t.text 'comment'
    t.integer 'user_id'
    t.integer 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'forums', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_forums_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.integer 'user_id'
    t.integer 'forum_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'votes_count'
    t.integer 'comments_count'
    t.index ['forum_id'], name: 'index_posts_on_forum_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'username', default: '', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['username'], name: 'index_users_on_username'
  end

  create_table 'votes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id'
    t.boolean 'upvote'
    t.boolean 'downvote'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_votes_on_post_id'
    t.index ['user_id'], name: 'index_votes_on_user_id'
  end

  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'forums', 'users'
  add_foreign_key 'posts', 'forums'
  add_foreign_key 'posts', 'users'
  add_foreign_key 'votes', 'posts'
  add_foreign_key 'votes', 'users'
end
